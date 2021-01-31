# Matlab知识点

## 2、数据类型

支持用户自定义类型

每种类型都以**数组**为基础

默认数据存储类型为**双精度浮点型double**

不用事先对变量类型进行定义或说明

**数据类型**：基本型、构造型、符号对象

**基本型：**数值型、字符串型

**构造型：**数组型、元胞型、结构型、类类型

**数值型：**整型、浮点型

**整型：**有符号、无符号

**浮点型：**单精度(4字节)、双精度(8字节)

**无符号：**uint8、uint16、uint32、uint64

**有符号：**int8、int16、int32、int64

**常量：**ans、eps(双$2^{-52}$ 单$2^{-23}$)、pi、i、j、inf、NaN、version

**变量：**所有变量都以数组或矩阵形式保存，赋值：以新值替代旧值，新变量类型替代旧变量类型

**变量命名：**第一个字符必为英文字母，最多63个字符

**变量查询函数：**who(列出工作空间中的变量名)、whos(列出变量名并给出其维数和性质)

**删除变量和内存重组命令：**

```matlab
clear: 删除所有自定义变量 并 恢复除 eps 以外的所有预定义变量
clear var1: 仅删除 变量 var1
clear var1 var2 ... : 删除多个
clear a*: 删除所有以a开头的变量
pack: 在不清除任何变量的情况下，重组和压缩已分配的内存碎块，得到更多空间
pack filename: 用名为filename的文件作为临时文件，重组和压缩已分配内存
```

**变量类型**

```matlab
局部变量：local  函数中定义的变量
全局变量：global 多个函数可以共享
	global MAXLEN;MAXLEN=45;
永久变量：persistent  类似于static,在M文件中定义和使用，永久保存，只在clear时被清除
	persistent MAXLEN;MAXLEN=45;
```

**整型类型转换：**

```matlab
x1 = int8(11); % 11
% 小数部分四舍五入处理
x2 = int8(15.49); % 15
x3 = int8(15.50); % 16
x4 = int8(130); % 127 超过了 2^7-1 则取 2^7-1 = 127
x5 = uint8(256); % 255
x6 = uint8(-1); % 0
```

**最大最小整数**

```matlab
intmax intmin 用来查询不同整形所能表示的最大整数和最小整数
intmax('int8')    ans=127
intmin('int8')    ans=-128
intmax('uint8')    ans=255
intmin('uint8')    ans=0
```

**浮点型变量**

````matlab
realmax('single')    ans=3.4028e+38
realmin('single')    ans=1.1755e-38
realmax('double')    ans=1.7977e+308
realmin('double')    ans=2.2251e-308
````

**浮点数类型转化**

```matlab
x = 35; % 此时为double型
y = single(x); % 转化为single型
class(x) % ans=double
class(y) % ans=single
```

**浮点数的取整函数**

```matlab
X = [-1.5 1.5]
round(X) : 四舍五入 towards nearest integer % [-2 2]
fix(X) : nearest integer towards 0 % [-1 1]
floor(X) : nearest integer towards minus infinity % [-2 1]
ceil(X) : nearest integer towards infinity % [-1 2]
```

**输出格式控制**

```matlab
format / format short : 短格式，小数点后保留4位小数；若大于1000，用科学计数法，仍保留4位小数
format long : 长格式，小数点后保留15位数字
format short e : 短格式 + 科学计数法
format long e : 长格式 + 科学计数法
format rat : 分数格式  pi = 335/113
format hex : 十六进制表示 4 * 16
format + : 正:+、负:-、0:空格
format bank : 银行格式，元角分，两位小数，3.14
```

**复数**

```matlab
2-3i % ans = 2.0000 - 3.0000i
complex(2,-3) % ans = 2.0000 - 3.0000i
complex(3) <=> complex(3,0)
```

**逻辑型变量**

```matlab
x = [true false true] % x = [1 0 1]
y = [7 2 9] > 5 % y = [1 0 1]
logical 数值类型转化为逻辑类型
双目运算符：&/and  |/or  xor  
单目运算符：~/not  any   all
不等于： ~=  , 而非 !=
测试运算：is*
字符串比较函数

逻辑数组索引：
A = rand(3)
% A =
    0.4218    0.9595    0.8491
    0.9157    0.6557    0.9340
    0.7922    0.0357    0.6787
A(A<0.5) = 0
% A =
         0    0.9595    0.8491
    0.9157    0.6557    0.9340
    0.7922         0    0.6787
```

**数组和矩阵**

```matlab
数组中元素可以是字符串
矩阵中只能是数

数组、矩阵的创建：
直接构造法：
	' ' 或 ',' 间隔元素，';' 或 回车 用于分行
增量法：
	x = i:j % 步长默认为1
	x = i:j:k % j为步长
	x = i:-j:k % -j为步长
	linspace(a,b,c) % 生成等差向量，a开始b结束c为生成元素个数，c缺省默认为100
	logspace(a,b,c) % 生成等比向量，10^a开始10^b结束c为生成元素个数，c缺省默认为50
>> x = 1:6
x =
     1     2     3     4     5     6
>> x = 6:1
x =
  空的 1×0 double 行向量
>> x = 6:-2:1
x =
     6     4     2
     
创建大矩阵：可由方括号中的小矩阵来建立
A = [1 2 3;4 5 6;7 8 9];
C = [A, eye(size(A)); ones(3), A*2] % eye(size(A)) 大小和A一样的单位矩阵

特殊矩阵：
通用格式：FUNC(a,b) or FUNC(a) <=> FUNC(a,a)
zeros : 全0
ones : 全1
eye : 单位阵/数组
magic : 魔方阵/数组
rand : 均匀分布
randn : 正态分布
diag : https://blog.csdn.net/majinlei121/article/details/50432909
size : 返回矩阵的行数和列数
length : 返回指定矩阵的行数和列数的最大值

矩阵元素： 可以自动扩展
>> A = [1 2 3;4 5 6;7 8 9];
A(4,3) = 99
% A =
     1     2     3
     4     5     6
     7     8     9
     0     0    99
    

'矩阵转置(共轭转置)  .'数组转置(非共轭转置)
>> A = [1-3i 2+4j; 5-4i 8+2j]
A =
   1.0000 - 3.0000i   2.0000 + 4.0000i
   5.0000 - 4.0000i   8.0000 + 2.0000i
>> A'
ans =
   1.0000 + 3.0000i   5.0000 + 4.0000i
   2.0000 - 4.0000i   8.0000 - 2.0000i
>> A.'
ans =
   1.0000 - 3.0000i   5.0000 - 4.0000i
   2.0000 + 4.0000i   8.0000 + 2.0000i
   
   
any(x):
若x为向量，任何元素为非零，则返回1
若x为矩阵，每一列存在元素非0，则返回1

all(x):
若x为向量，所有元素都非零，则返回1
若x为矩阵，每一列所有元素非0，则返回1


矩阵拆分-利用冒号获取子矩阵
A(r,c)	获取r行c列元素组成的子数组
A(r,:)	获取r行所有列元素组成的子数组
A(:,c)	获取c列所有行元素组成的子数组
A(:)	数组A中所有列元素首尾相连组成的 一维长列 子数组
A(i)	A(:)中第i个元素
A(:)=B(:)	全元素赋值，效果和 A=B 一样


矩阵的删除：
clear X	将X从工作区中清除
X = []	只将X的元素清空为0维，不清除X变量名
>> A = [1 4 7 2;5 8 3 6;9 11 15 19]
A =
     1     4     7     2
     5     8     3     6
     9    11    15    19
>> A(:,3:4) = []
A =
     1     4
     5     8
     9    11
     
     
其他操作：
A = diag(B,k)	提取矩阵对角线元素生成向量 或 由向量作为对角线生成矩阵
		https://blog.csdn.net/majinlei121/article/details/50432909
A = flipud(B)	矩阵上下翻转
A = fliplr(B)   矩阵左右翻转
A = reshape(B,r,c)	在总元素数目不变的情况下，将B变形为r行c列
A = rot90(B)	矩阵逆时针旋转90度
det(A)			求方阵的行列式值
rank(A)			矩阵的秩
trace(A)		矩阵的迹
pinv(A)			矩阵的伪逆
inv(A)			矩阵的逆
max(A)			列优先
A =
    16     2     3    13
     5    11    10     8
     9     7     6    12
     4    14    15     1
>> max(A)
ans =
    16    14    15    13
>> [Y,I] = max(A)
Y =
    16    14    15    13
I =
     1     4     4     1
>> [Y,I] = max(max(A))
Y =
    16
I =
     1
     
     
求矩阵特征值
d = eig(A)	求A的特征值，构成向量d
d = eig(A,B)	如果A，B都为一个方阵，则返回一个广义的特征值向量
[V,D] = eig(A) 	求A的全部特征值，构成对角矩阵D，并求A的特征向量构成V的列向量
A =
    16     2     3    13
     5    11    10     8
     9     7     6    12
     4    14    15     1
>> eig(A)
ans =
   34.0000
    8.9443
   -8.9443
   -0.0000
>> [V,D] = eig(A)
V =
   -0.5000   -0.8236    0.3764   -0.2236
   -0.5000    0.4236    0.0236   -0.6708
   -0.5000    0.0236    0.4236    0.6708
   -0.5000    0.3764   -0.8236    0.2236
D =
   34.0000         0         0         0
         0    8.9443         0         0
         0         0   -8.9443         0
         0         0         0   -0.0000
         
         
         
矩阵分解：
	三角分解(可逆方阵)
	[L,U] = lu(A) 	将矩阵A分解为一个下三角形矩阵L和一个上三角形矩阵U的乘积 即 A = LU
	正交分解/QR分解(满秩矩阵)
	[Q,R] = qr(A)	将矩阵分解为一个正交矩阵Q(QQ'=E)和一个上三角形矩阵R的乘积  即 A = QR
	[Q,R,E] = qr(A)
	特征值分解：eig
	奇异值分解：svd
	Cholesky分解：chol
```

**字符串** : 一维字符数组

```matlab
>> c1 = 'Beihang'
c1 =
    'Beihang'
>> whos
  Name      Size            Bytes  Class    Attributes
  c1        1x7                14  char     

转换成字符串的函数：
char(97)	% ans = 'a'
num2str(97) % ans = '97'
int2str(97) % ans = '97'
mat2str(A)  % 矩阵转化成字符串表示形式
A =
     8     1     6
     3     5     7
     4     9     2
>> mat2str(A)
ans =
    '[8 1 6;3 5 7;4 9 2]'
    
字符串合并-水平合并：
>> str1 = ['I','Love ','Matlab']
str1 =
    'ILove Matlab'
>> str1 = ['I' 'Love ' 'Matlab']
str1 =
    'ILove Matlab'
%%%%% 若用strcat 会自动去掉原字符串结尾处的空格
>> str2 = strcat('I','Love ','Matlab ')
str2 =
    'ILoveMatlab'
    
  
垂直合并：
	中括号：
        >> str3 = ['Matlab';'larryhawking']
        错误使用 vertcat
        要串联的数组的维度不一致。
        >> str3 = ['Matlab      ';'larryhawking']
        str3 =
          2×12 char 数组
            'Matlab      '
            'larryhawking'

    strvcat: %%% 会自动补齐空格
        >> str3 = strvcat('Matlab      ','larryhawking')
        str3 =
          2×12 char 数组
            'Matlab      '
            'larryhawking'
        >> str3 = strvcat('Matlab','larryhawking')
        str3 =
          2×12 char 数组
            'Matlab      '
            'larryhawking'
            
size()、length()两函数原理与数组一致

cellstr : 将字符数组转化为字符串单元数组  %%%% 会去除末尾空格
    str2 =
        'ILoveMatlab'
    >> cellstr(str2)
    ans =
      1×1 cell 数组
        {'ILoveMatlab'}
    str3 =
      2×12 char 数组
        'Matlab      '
        'larryhawking'
    >> cellstr(str3)  %%%% 会去除末尾空格
    ans =
       2×1 cell 数组
         {'Matlab'      }
         {'larryhawking'}
char : 将字符串单元数组转化为字符数组
	cellstr的逆过程
iscellstr/isspace/isletter : 返回逻辑值
    >> isspace('sd ')
    ans =
      1×3 logical 数组
       0   0   1
sort : 对字符串排序
strmatch : 查找匹配字符串
findstr : 在一个字符串中查找另一个字符串
    >> findstr('young','yyyoungnnn')
    ans = 3
    >> findstr('1234','23')
    ans = 2
strrep : 替换字符串
strcmp : 比较字符串 相同返回1 不同返回0
strcmpi : 忽略大小写比较字符串
strncmp : 比较字符串的前n个字符
upper、lower : 转换为大、小写
blanks(n)、deblank : 产生长度为n的空字符串、移除字符串尾部的空格
    >> strcat(str5, blanks(5)) %% strcat会去除所连接的所有字符串尾部的空格
    ans =
        'larry'
    >> strcat(str5, ' hawking')
    ans =
        'larry hawking'
    >> deblank('abdf     ')
    ans =
        'abdf'
strtok : 返回字符串中第一个分隔(空格、回车、Tab键)前的部分

字符串属性判断：
通用款   isstrprop('str','category')
其中 category 可以取 : [alpha、alphanum、cntrl、digit、lower、print、punct、upper、xdigit]
iss =
    ' 21 asd \t \n - _ ? .> 4 5'
>> isstrprop(iss,'alpha') % 字母
ans =
  1×26 logical 数组
  0   0   0   0   1   1   1   0   0   1   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0
>> isstrprop(iss,'alphanum') % 字母或数字
ans =
  1×26 logical 数组
  0   1   1   0   1   1   1   0   0   1   0   0   1   0   0   0   0   0   0   0   0   0   0   1   0   1
>> char(0:20)
ans =
    ' 	
     
     '
>> isstrprop(char(0:20), 'cntrl') % 控制符
ans =
  1×21 logical 数组
   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
>> isstrprop(iss,'digit') % 数字
ans =
  1×26 logical 数组
  0   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   1
>> isstrprop(iss,'print') % 可打印字符
ans =
  1×26 logical 数组
  1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
>> isstrprop(iss,'punct') %% 标点符号
ans =
  1×26 logical 数组
  0   0   0   0   0   0   0   0   1   0   0   1   0   0   1   0   1   0   1   0   1   0   0   0   0   0
>> isstrprop('0x123456789abcdefg','xdigit') % 16进制数字符
ans =
  1×18 logical 数组
   1   0   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   0


hex2dec : 将16进制字符串转化为10进制整数 不能带0x
    >> hex2dec('12')
    ans =
        18
    >> class(hex2dec('12'))
    ans =
        'double'
dec2hex : 逆
bin2dec : 二进制字符串转化为10进制整数 dec2bin 逆
```

**函数句柄：**

```matlab
在已有函数名前加符号@，即可创建函数句柄
fun = @functionname
% 为匿名函数创建一个句柄
sqr = @(x)x.^2;a=sqr(5)
a = 25
```

**元胞数组：**

```matlab
组成元素是 元胞(cell)
元胞 可用来存储不同类型数据的单元，每个元胞存储一种matlab数据类型的数组，数组中的数据可以是任意类型，包括自定义类型，大小任意
元胞数组可以将不同类型不同尺寸的数据存储到同一个数组中
访问索引要用'{'和'}'

创建元胞数组
a = {[2 4 7;3 9 6;1 8 5], 'Li Si', 2+3i, 1:2:10}
a =
  1×4 cell 数组
    {3×3 double}    {'Li Si'}    {[2.0000 + 3.0000i]}    {1×5 double}

>> a{1,1}
ans =
     2     4     7
     3     9     6
     1     8     5
>> a{1}
ans =
     2     4     7
     3     9     6
     1     8     5
>> a{2}
ans =
    'Li Si'
>> a{3}
ans =
   2.0000 + 3.0000i
>> a{4}
ans =
     1     3     5     7     9
>> a{1,4}
ans =
     1     3     5     7     9
>> a{2,4}
位置 1 处的索引超出数组边界(不能超出 1)。


>> a=cell(3)
a =
  3×3 cell 数组
    {0×0 double}    {0×0 double}    {0×0 double}
    {0×0 double}    {0×0 double}    {0×0 double}
    {0×0 double}    {0×0 double}    {0×0 double}
>> a=cell(3,3)
a =
  3×3 cell 数组
    {0×0 double}    {0×0 double}    {0×0 double}
    {0×0 double}    {0×0 double}    {0×0 double}
    {0×0 double}    {0×0 double}    {0×0 double}
>> a{3,2}=rand(3,5);a{1,1}='hello; world'
a =
  3×3 cell 数组
    {'hello; world'}    {0×0 double}    {0×0 double}
    {0×0 double    }    {0×0 double}    {0×0 double}
    {0×0 double    }    {3×5 double}    {0×0 double}
 
deal函数 查看元胞数组内容
a = {[2 4 7;3 9 6;1 8 5], 'Li Si', 2+3i, 1:2:10}
[a b c d] = deal(a{:})
a =
     2     4     7
     3     9     6
     1     8     5
b =
    'Li Si'
c =
   2.0000 + 3.0000i
d =
     1     3     5     7     9
     
     
>> a = {[2 4 7;3 9 6;1 8 5], 'Li Si'; 2+3i, 1:2:10}
a =
  2×2 cell 数组
    {3×3 double        }    {'Li Si'   }
    {[2.0000 + 3.0000i]}    {1×5 double}
>> a(:,2) = []      % 此处用小括号
a =
  2×1 cell 数组
    {3×3 double        }
    {[2.0000 + 3.0000i]}
>> a{1,2} = []      % 单个用花括号
a =
  2×2 cell 数组
    {3×3 double        }    {0×0 double}
    {[2.0000 + 3.0000i]}    {1×5 double}
>> a{:,:}
ans =
     2     4     7
     3     9     6
     1     8     5
ans =
   2.0000 + 3.0000i
ans =
     []
ans =
     1     3     5     7     9
>> a(:,:)
ans =
  2×2 cell 数组
    {3×3 double        }    {0×0 double}
    {[2.0000 + 3.0000i]}    {1×5 double}
    
C = num2cell(A) : 把多维数组A转换成元胞数组C
    A =
         8     1     6
         3     5     7
         4     9     2
    >> C = num2cell(A)
    C =
      3×3 cell 数组
        {[8]}    {[1]}    {[6]}
        {[3]}    {[5]}    {[7]}
        {[4]}    {[9]}    {[2]}
C = num2cell(A,2) : 把多维数组A转换为元胞数组C，指定dim维作为单独的元胞
    >> C = num2cell(A,2)
    C =
      3×1 cell 数组
        {1×3 double}
        {1×3 double}
        {1×3 double}
    >> C{:,:}
    ans =
         8     1     6
    ans =
         3     5     7
    ans =
         4     9     2
    >> C = num2cell(A,1)
    C =
      1×3 cell 数组
        {3×1 double}    {3×1 double}    {3×1 double}
    >> C{:,:}
    ans =
         8
         3
         4
    ans =
         1
         5
         9
    ans =
         6
         7
         2
C = mat2cell(A,r) 返回一个列单元数组，正整数向量r之和是A的行数
    A =
         8     1     6
         3     5     7
         4     9     2
    >> C = mat2cell(A,[1 2])
    C =
      2×1 cell 数组
        {1×3 double}
        {2×3 double}
    >> C{:,:}
    ans =
         8     1     6
    ans =
         3     5     7
         4     9     2
C = mat2cell(A,m,n) 正整数向量m划分行，n划分列
    >> C = mat2cell(A,[1 2],[2 1])
    C =
      2×2 cell 数组
        {1×2 double}    {[       6]}
        {2×2 double}    {2×1 double}
    >> C{:,:}
    ans =
         8     1
    ans =
         3     5
         4     9
    ans =
         6
    ans =
         7
         2

元胞数组显示：celldisp(C)
    C =
      2×2 cell 数组
        {1×2 double}    {[       6]}
        {2×2 double}    {2×1 double}
    >> celldisp(C)
    C{1,1} =
         8     1
    C{2,1} =
         3     5
         4     9
    C{1,2} =
         6
    C{2,2} =
         7
         2
    >> celldisp({[2 4 7;3 9 6;1 8 5], 'Li Si', 2+3i, 1:2:10})
    ans{1} =
         2     4     7
         3     9     6
         1     8     5
    ans{2} = 
    	Li Si
    ans{3} =
       2.0000 + 3.0000i
    ans{4} = 
         1     3     5     7     9
         
cellplot(A) : 图形显示元胞数组的内容
	>> cellplot({[2 4 7;3 9 6;1 8 5], 'Li Si', 2+3i, 1:2:10})
```

**结构数组：**

基本成分是结构，每个字段叫做一个域，数据不能直接存放在结构中只能存放在域中

编址方式：单下标编址、全下标编址

```matlab
创建结构数组
	1、利用赋值语句创建结构
		>> student(1).name = 'larry'
        student = 
          包含以下字段的 struct:
            name: 'larry'
        >> student(1).course = [123 4343]
        student = 
          包含以下字段的 struct:
              name: 'larry'
            course: [123 4343]
        >> student(1).score = [87 92]
        student = 
          包含以下字段的 struct:
              name: 'larry'
            course: [123 4343]
             score: [87 92]
        >> student(2).name = 'young'
        student = 
          包含以下字段的 1×2 struct 数组:
            name
            course
            score
        >> student(2).course = [21 23 4 ; 34  43 45]
        student = 
          包含以下字段的 1×2 struct 数组:
            name
            course
            score
        >> student(2).hobby = 'hklj'
        student = 
          包含以下字段的 1×2 struct 数组:
            name
            course
            score
            hobby
        >> student(1).hobby
        ans = []
        >> student.course
        ans =
                 123        4343
        ans =
            21    23     4
            34    43    45
        >> student(1).course = 'sdad'
        student = 
          包含以下字段的 1×2 struct 数组:
            name
            course
            score
            hobby
        >> student(1).course
        ans = 'sdad'
    2、利用结构函数struct创建结构
    	student(3) = struct('name','Wang Wu','course',[10568 10063],'course',[79 68])
            >> student(3) = struct('name','Wang Wu','course',[10568 10063],'score',[79 68])
            student = 
              包含以下字段的 1×3 struct 数组:
                name
                course
                score
            >> student(4) = struct('name','Wang Wu','course',[10568 10063],'score',[79 68])
            student = 
              包含以下字段的 1×4 struct 数组:
                name
                course
                score
访问结构数组的数据
    >> str1 = student(3).name
    str1 =
        'Wang Wu'
    >> getfield(student(4),'course')
    ans =
           10568       10063
    >> student.score
    ans =
         []
    ans =
         []
    ans =
        79    68
    ans =
        79    68
        
添加域
    >> student(1).sex = 'male'
    student = 
      包含以下字段的 1×4 struct 数组:
        name
        course
        score
        sex
删除域
    >> student = rmfield(student, {'course','score'})
    student = 
      包含以下字段的 1×4 struct 数组:
        name
        sex
    >> student = rmfield(student, 'sex')
    student = 
      包含以下字段的 1×4 struct 数组:
        name
    >> student.course
    引用了不存在的字段 'course'。
```

## 3、程序设计

**顺序结构**

````matlab
数据的输出：
	disp(输出项)
	fprintf('输出格式'，输出项) <=> disp(sprintf('输出格式'，输出项))
输入：
	ans = input('提示语句')
	ans = input('提示语句','s') % 输入一个字符串
	>> input('提示语句','c')
    错误使用 input
    INPUT 的第二个参数必须为 's'。
    
    s = setstr(N) % 将ASCII码矩阵或数组N转化成字符串s，效果与char()相同
    N = abs(s) % 上述过程的逆
    ans =
        '1234'
    >> abs(ans)
    ans =
        49    50    51    52
    >> setstr(ans)
    ans =
        '1234'
    >> char([49 50 51 52])
    ans =
        '1234'
    >> char([49 50;51 52])
    ans =
      2×2 char 数组
        '12'
        '34'
    >> setstr([49 50;51 52])
    ans =
      2×2 char 数组
        '12'
        '34'
    >> abs(ans)
    ans =
        49    50
        51    52
    
程序暂停：
	pause(延迟秒数)按任意键后继续执行 、 ctrl+C
````

**条件结构**

```matlab
单分支：
	if 表达式
		语句组A
	end
双分支：
	if 表达式
		语句组A
	else
		语句组B
	end
多分支：
	if 表达式1
		语句组A
	elseif 表达式2
		语句组B
	else
		语句组C
	end
[Little Tricks]
	自动对齐：Ctrl+I 、右键 smart indent
```

**选择结构**

```matlab
switch 表达式
case 常量表达式1
	语句1
case 常量表达式2
	语句2
...
otherwise
	语句n+1
end
% 不需要break，默认自动break
% switch 后的表达式可以为任意类型，如字符串、矩阵、数组
示例：
price=input('请输入商品价格')
switch fix(price/100)
	case {0,1}	% 价格小于200
		rate=0;
	case {2,3,4}	% 价格>=200 && <500
		rate=3/100;
	case num2cell(5:9)	% >=500 && <1000
		rate=5/100;
	case num2cell(10:24)	% >=1000 && <2500
		rate=8/100;
	case num2cell(25:49)	% >=2500 && <5000
		rate=10/100;
	otherwise	% >=5000
		rate=14/100;
end
price=price*(1-rate)
```

**循环结构**

```matlab
for循环：
	for 循环变量=表达式1：表达式2：表达式3
		循环体语句
	end
	% 表达式1：初值
	% 表达式2：步长 缺省则默认为1
	% 表达式3：终值

补充：
https://www.cnblogs.com/yymn/p/4744176.html
>> rem(3,-2)	% ans = 1
>> mod(3,-2)	% ans = -1
>> rem(-3,2)	% ans = -1
>> mod(-3,2)	% ans = 1
>> rem(-3,-2)	% ans = -1
>> mod(-3,-2)	% ans = -1
>> rem(3,2)	% ans = 1
>> mod(3,2)	% ans = 1
同正都为正，同负都为负，异号则mod(x,y) = rem(x,y) + y

示例：
	如求级数
	y=0;n=100;
	for i=1:n
		y = y + 1/(2*i-1);
	end
	在matlab中，这样的循环速度很慢，一般用如下语句替代
	n=100;i=1:2:2*n-1;
	y=sum(1./i);
	
while循环：
	while 表达式
		循环语句组
	end
```

**try-catch语句**

```matlab
try
	语句组1
catch
	语句组2
end
%%%%%%%%%%%%%%%%%%%%%%%%%
try语句执行语句组1,如遇到错误，则将错误信息赋值给保留的lasterr变量，并转执行语句组2

通过msgstr = lasterr，将错误信息返回
```

**M文件**

扩展名为.m，是一个标准的文本文件

可以在任何文本编辑器中编辑、存储、修改和读取

默认使用meditor编辑器

类似于一般的高级语言

matlab运初始运行M文件时会将代码装入内存，再次运行时直接从内存中取出，因此会大大加快程序运行速度

主要包括函数(Functions)和脚本(Scripts)两种

**脚本文件：**既不接受输入参数，也不返回输出参数的M文件称为脚本

脚本文件中的变量都为全局变量，为了避免变量名冲突，一般在脚本文件开始，都采用clear all清除所有基本空间中的变量

**函数文件**：为实现特定功能而供其他程序调用的M文件，第一行以function开头

各种matlab函数或命令实际上都是函数文件

函数M文件执行过程中产生的变量是局部变量，存放在自身的函数工作空间中，不会和基本工作空间中的变量名冲突

```matlab
函数文件组成结构：
	function 返回变量=函数名(输入变量)  % 函数定义
	% 帮助文档语句段
	% 注释说明语句段
	程序语句段
帮助文档语句段是 help 函数名 时对函数的说明内容，具体指 第一个非空行前的所有注释

与命令文件的主要区别：
参数：命令文件没输入参数，不返回输出参数，而函数文件都可
变量：命令文件操作的结果变量都保存在基本工作空间，而函数文件都保存在局部空间，运行完即清除
运行：命令文件可以直接运行，函数文件需要以函数调用方式运行

变量的检测传递：
	输入输出参数检测命令：
		nargin：在函数体内，获取函数输入参数的数目
		nargout：...输出...
		nargin('fun'): 获取'fun'指定函数的输入参数数目
		nargout('fun'): ...输出...
		inputname(n): 在函数体内，给出第n个输入参数的实际调用变量名
	变长度输入输出参数：
		varargin：变长度输入参数列表
		varargout：变长度输出参数列表
		function varargout = fun(varargin)
		varargout(k) = varargin(k) % <=> {varargin{k}} 元胞数组
		
全局变量需使用global函数定义，且在任何使用该全局变量的函数中都应加以定义，包括命令窗口
```

**程序调试与优化**

**错误种类：**语法错误、运行错误

使用keyboard命令中断程序，使用return命令退出

在函数头前加%，这样函数式M文件变为脚本式M文件，其工作区间就是MATLAB的工作区间，出错就能查询这个工作区间

```matlab
程序优劣分析：
profile函数：在 计算相对耗时 以及 查找文件执行过程中瓶颈问题 时更有效
	profile on % 开启性能分析
	待分析语句
	profile viewer % 图形显示性能分析结果
	profsave	% 保存
tic、toc函数：在 计算绝对耗时 时更有效
	tic	% 开启计时
	待统计时间的语句
	toc % 结束计时
	
程序优化的技巧：
	程序的向量化操作：使用向量和矩阵运算替换循环语句
	数据的预定义：...
```



## 4、数值计算

**最大最小值**

```matlab
求向量最大值：
	C = max(A)
	[C,I] = max(A)
求矩阵最大值：
	max(A) : 返回一个行向量，为每一列的最大值
	C = max(A,[],dim)
	>> A = magic(3)
    A =
         8     1     6
         3     5     7
         4     9     2
    >> max(A,[],'all')
    ans =
         9
    >> max(A,[],1)
    ans =
         8     9     7
    >> max(A,[],2)
    ans =
         8
         7
         9
    >> [V,I] = max(A,[],'all','linear')
    V =
         9
    I =
         6
    >> [V,I] = max(A,[],1)
    V =
         8     9     7
    I =
         1     3     2
    >> [V,I] = max(A,[],2)
    V =
         8
         7
         9
    I =
         1
         3
         2
         
两个向量或矩阵对应元素比较
	U = max(A,B) % A，B为同型向量或矩阵
	U = max(A,n) % n为标量
```

**平均值**

```matlab
mean函数
M = mean(X) 返回向量X的算数平均值
M = mean(A) 返回一个行向量，对应A中每一列的平均值
M = mean(A,dim) dim==1时同上，dim==2时返回列向量，对应每一行的平均值
```

**中位数**

```matlab
median函数 格式同上
```

**求和函数**

```
sum函数 格式同上
```

**求积函数**

```
prod函数 格式同上
```

**累加和**

```matlab
cumsum函数 格式同上，效果如下

T =
     8     1     6
>> cumsum(T)
ans =
     8     9    15
     
>> A = magic(3)
A =
     8     1     6
     3     5     7
     4     9     2
>> cumsum(A)
ans =
     8     1     6
    11     6    13
    15    15    15
>> cumsum(A,1)
ans =
     8     1     6
    11     6    13
    15    15    15
>> cumsum(A,2)
ans =
     8     9    15
     3     8    15
     4    13    15
```

**累乘积**

```matlab
cumprod函数 格式效果同上
```

**标准方差**

```matlab
std函数

S = std(X) 对向量X返回一个标准差
S = std(A) 对矩阵A返回一个行向量.....
S = std(A,flag,dim)
当dim==1，各列标准差行向量
当dim==2，各行标准差列向量
当flag==0,利用N-1标准化(样本标准差)
当flag==1,利用N标准化(总体标准差)
```

**相关系数**

```matlab
corrcoef函数   计算数据的相关系数矩阵

R = corrcoef(X) 返回从矩阵X形成的一个相关系数矩阵，其大小和X一样？？？？，它把矩阵X的每列作为一个变量，然后求它们的相关系数

A =
     8     1     6
     3     5     7
     4     9     2
>> a1 = A(:,1)
a1 =
     8
     3
     4
>> a2 = A(:,3)
a2 =
     6
     7
     2
>> corrcoef(a1,a2)
ans =
    1.0000    0.1429
    0.1429    1.0000
>> corrcoef([a1,a2])
ans =
    1.0000    0.1429
    0.1429    1.0000
>> [a1,a2]
ans =
     8     6
     3     7
     4     2
>> corrcoef(magic(3))
ans =
    1.0000   -0.7559    0.1429
   -0.7559    1.0000   -0.7559
    0.1429   -0.7559    1.0000
```

**排序**

```matlab
sort函数

B = sort(X) 返回X向量的升序向量
B = sort(A) 对各列排序
[B,IX] = sort(A,dim) dim==1 列排序 ; dim==2 行排序 IX记录B中元素在A中的位置
A =
     8     1     6
     3     5     7
     4     9     2
>> [B,IX] = sort(A)
B =
     3     1     2
     4     5     6
     8     9     7
IX =
     2     1     3
     3     2     1
     1     3     2
```

**复数及其运算**

```matlab
real 提取实部
imag 提取虚部
abs	 计算模
angle	计算辐角
conj	计算共轭
```

**复数绘图**

```matlab
1、直角坐标系 (x,y) = (real,imag)
2、极坐标系 (rho,theta) = (abs,angle)

极坐标绘图：
polar(theta,rho)
polar(theta,rho,LineSpec)
LineSpec : 绘制线型

示例: 绘制 y=2t+itsin(t) 在两种坐标系下的效果图
t = 0:0.02:2*pi;
>> y = 2*t+i*t.*sin(t);
>> xaxis = real(y);
>> yaxis = imag(y);
>> subplot(1,3,1);plot(xaxis,yaxis);   % 这两种画法等效
>> subplot(1,3,2);plot(y);             % 这两种画法等效
>> rho = abs(y);
>> theta = angle(y);
>> subplot(1,3,3);polar(theta,rho);
```

**多项式运算**

多项式表示为一个行向量，其中的元素按照降幂排列

```matlab
poly: 产生特征多项式的系数向量
	格式：p=poly(a) % a为多项式的解，生成的特征多项式一定是n+1维的，且第一个元素一定是1
	示例：a=[1 2 3];p=poly(a)   % p = [1 -6 11 -6]
poly2str: 把多项式系数转化为字符形式
	格式：p1=poly2str(p,'x') % p为多项式系数向量，变量取x
	示例：p1=poly2str(p,'x') % p1 = 'x^3 - 6 x^2 + 11 x - 6'
poly2sym: 转化为符号多项式
	格式：p2=poly2sym(p,'x')
	示例：p2=poly2sym(p,'x') % p2 = 'x^3 - 6*x^2 + 11*x - 6'
	
	
加减运算：需要补成相同阶次
乘运算：conv(p1,p2) 相当于执行两数组的卷积
除运算：deconv(p1,p2) 相当于执行两数组的解卷
	[d,r] = deconv(c,a) % r:余数 d:整除数
	
	
多项式的根：roots函数
	r = roots(c) % c为多项式的系数向量  返回的根表示为列向量
	c = poly(r) % r为多项式的根   返回的系数矩阵表示为行向量
	

多项式求值：polyval函数
	y = polyval(p,x) 对多项式p在x取值处求值
	示例：p = [1 2 1];y=polyval(p,2)  % y = 9
		 y = polyval(p,0:3) % y = 1 4 9 16
		 x = [1 2;3 4];y=polyval(p,x) % y = [4 9;16 25]
		 
按矩阵方式求值：polyvalm(p,x) % x必须为方阵
	示例：p = [1 2 1];y=polyvalm(p,2)  % y = 9
		 x = [1 2;3 4];y=polyvalm(p,x) % y = [10 14;21 31]
		 
多项式微分：polyder函数
	示例：k = polyder(p) % 对多项式p进行微分运算
		 k = polyder(a,b) % 对多项式a,b的乘积微分
		 [p,q] = polyder(a,b) % 对多项式a,b的商微分 以p/q表示
		
多项式积分：polyint函数
	polyint(p,k) % 返回以向量p为系数的多项式积分，k为常数项
	polyint(p) % 常数项默认为0
	
多项式部分分式展开：residue(b,a)
	[r,p,k] = residue(b,a)
	求多项式b与a之比b/a的分式展开，r:留数(分子) p:部分分式的极点(分母) k:常数项
	示例：
	>> B = [3 8];A = [1 5 6];
    >> [R P K] = residue(B,A)
    R =
        1.0000
        2.0000
    P =
       -3.0000
       -2.0000
    K = []
	% 最后的式子为：1/(x+3) + 2/(x+2)
	
曲线拟合：p=polyfit(x,y,n) % 对x和y进行n维多项式拟合
```

**插值**

```matlab
插值：
一维插值：yi = interp1(x,y,xi,method)
	% x: 已知的x坐标向量
	% y: 已知的y坐标向量
	% method：规定插值方法的字符串
	% xi、yi：插值点、返回得到的插值结果
二维栅格点插值：zi = interp2(x,y,z,xi,yi,method)
二维散布点插值：zi = griddata(x,y,z,xi,yi)
三维栅格点插值：vi = interp3(x,y,z,v,xi,yi,zi,method)
高维栅格点插值：interpn
method取值:
	最近邻内插法：'nearest'
	线性内插法：'linear'，为默认值
	三次样条内插法：'spline'
	三次多项式内插法：'cubic'
```

**函数优化**

```matlab
fminbnd : 无约束单变量寻优函数
	x = fminbnd(fname,x0,x1)
	% fname : 要求极小值的函数名
	% x0,x1是指定的搜索范围
	% 返回值x是最小值对应的自变量
fplot('sin',[0,2*pi]) % 画出函数sin(x)在区间[0,2*pi]上的图形

fminsearch : 可计算多元函数最小值点
	[X,FVAL,EXITFLAG,OUTPUT] = fminsearch(FUN,X0)
	% FUN : 函数名
	% X0 : 初始的搜索位置
	% X : 最小值点
	% FVAL : 最小值点处的函数值
	% EXITFLAG=1 表示计算成功
	% OUTPUT : 结构数组，记录计算过程的参数
```

**代数方程求解**

```matlab
代数方程组求解：
对于ax-b=0 , a为n×m矩阵
if n==m 恰定方程 % (1)比(2)快2.5倍
	(1)x=a\b
	(2)x=inv(a)*b
if n>m 超定
	(1)x=a\b 用最小二乘法找一个准确的基本解
	(2)x=inv(a'*a)*a'*b
if n<m 欠定
	(1)x=a\b : 具有最多0元素的解
	(2)x=pinv(a)*b : 具有最小长度或范数的解
```

**常微分方程(ODE)求解**

解析解：准确的解

数值解：方程较复杂无法求解析表达式，采用数值解法求近似解

```matlab
dsolve
	% 解符号常微分方程、方程组
	% 如果没有初始条件，求出通解；若有，求出特解
	r = dsolve('eq1','eq2',...,'cond1','cond2',...,'v')
	% 'eq1','eq2',... 为微分方程或微分方程组
	% 'cond1','cond2',... 初始条件或边界条件
	% 'v' 独立变量，默认为't'  每个方程可以设一个  若多对一则为常微分方程 组
	y的一阶导数表示为Dy，n阶表示为Dny
	示例：
	(1)解dy/dx=x
	dsolve('Dy=x','x')
	(2)
	[X,Y] = dsolve('Dx+2*x-Dy=10*cos(t)','Dx+Dy+2*y=4*exp(-2*t)','x(0)=2','y(0)=0','t')
solver
	[T,Y]=solver(odefun,tspan,y0)
	% 在区间tspan=[t0,tf]上，用初始条件y0求解显示常微分方程 y'=f(t,y)
euler1 : 欧拉法 在节点处用差商近似代替倒数
	[T,Y]=euler1(odefun,tspan,y0,h)
。。。。。。。。过于复杂看8懂
```

## 5、符号运算

求 $ax^2+bx+c=0$ 的根

```matlab
syms a b c x;
solve('a*x^2+b*x+c')
```

求 $f(x)=(\cos x)^2$ 的一次导数

```matlab
x=sym('x');
diff(cos(x)^2) % ans = -2*cos(x)*sin(x)
```

计算 $f(x)=x^2$ 在区间 [a,b] 上的定积分

```matlab
syms a b x;
int(x^2,a,b) % ans = b^3/3 - a^3/3
```

符号运算优势：准确、不存在截断误差、能给出完全正确的封闭解或任意精度的数值解

劣势：运行时间长

**符号对象**是一种**数据结构**

**符号矩阵/数组：**元素为符号表达式的矩阵、数组

**符号表达式：**含有符号对象的表达式，是字符串类型

**符号对象的创建：**

```matlab
sym:
	S = sym(A,flag) % 定义符号对象S
	% A 可以是常量、变量、函数、表达式
	% flag 可取 'd','f','e','r'
	示例：
	a = sym('a') % 符号变量
	b = sym(1/3) % 符号常量
	c = sym('2*a+b') % 符号表达式
	d = sym('sin(1)') % 符号函数
	sym(2) 和 sym('2') 的区别 https://www.zhihu.com/question/36175248/answer/66579664
	
syms: 一次创建多个符号对象
	syms('符号变量名1','符号变量名2',...)
	syms '符号变量名1','符号变量名2',...
	syms 符号变量名1 符号变量名2 ...
	
		syms a b c
	<=> a = sym('a');
		b = sym('b');
		c = sym('c');
```

**符号表达式的操作**

```matlab
numden: 通分、约分
	[N,D]=numden(f)
	% N 通分后的分子 D 通分后的分母
	syms x y;
	f = x/y+y/x;
	[N,D]=numden(f)
	------------------------
	[n,d] = numden(sym(112/1024))
        n = 7
        d = 64
factor：因式分解、分解质因数
	syms x; f=x^6+1,factor(f)
	---------------
	factor(100)
		ans = 2 2 5 5
	------------------
	factor(sym('12345678901234567890'))
	--------------------------------
	factor(12345678901234567890) % 数据过大 会报错
expand：符号表达式展开
	expand(f)
collect: 合并同类项
	collect(s) : 对符号表达式s合并同类项
	collect(s,v) : 对符号表达式s按变量v合并同类项
simplify(f)：利用函数规则对f进行化简
simple(f): 对f尝试多种方式化简，返回包含字符数目最少的形式
[How,y]=simple(f) : y为f的最简短形式，How记录化简过程中使用的方法
horner(f): 将多项式f转化为秦九韶嵌套多项式
pretty(f): 显示为习惯书写形式

sym2poly(f): 转化为多项式，返回多项式系数数组 % 只能对含有一个变量的符号表达式进行转换
poly2sym(P): 将系数行向量，转化为符号表达式

符号数值精度控制
算数运算方式：数值型(运算速度最快)、有理数型(运算结果准确)、VPA型(灵活设置任意有效精度)
相互转换函数：sym(),vpa(),double()
digits: 显示当前计算精度，默认32位
digits(n): 设置计算数值型结果时以n位相对精度进行
xr = vpa(x): 给出x在digits指定精度下的数值型结果xr
xr = vpa(x,n): 给出x在n位相对精度下的数值型结果xr

findsym(s,n): 查找一个符号表达式s中的n个符号变量，若没有指定n，则返回全部符号变量
注：syms a b x y; c=sym('4'); findsym(a*x+b*y+c) % ans = a,b,x,y 符号常量c不在结果中出现

subs: 符号变量的替换
subs(f,a): 用a替换f中的(第一)自由变量
subs(f,x,a): 用a替换f中指定的符号x
% a可以是数、数值变量、数值表达式、字符变量、字符表达式
% a,x也可以是数组或矩阵，但必须尺寸相同

compose: 复合函数运算
compose(f,g): f(g(x))
compose(f,g,z): f(g(z))
compose(f,g,x,z): 返回f(g(z)),并使x成为f函数的独立变量
compose(f,g,x,y,z): 返回f(g(z)),并使x与y分别成为f与g函数的独立变量

finverse：反函数
g=finverse(f): f的反函数
g=finverse(f,v): f关于指定变量v的反函数

符号微积分
limit: 符号极限
limit(f): 求符号函数f在变量x=0的极限值
limit(f,x,a): 求符号函数f在变量x趋于a时的极限值 % 当左右极限不相等时，极限不存在
limit(f,x,a,'left'): 求符号函数f在变量x趋于a时的左极限值
limit(f,x,a,'right'): 求符号函数f在变量x趋于a时的右极限值

符号导数
g=diff(f) 默认变量
g=diff(f,v) 关于变量v
g=diff(f,n) 关于默认变量的n阶导数
g=diff(f,v,n) 关于变量v的n阶导数

积分函数
int(f)
int(f,v)
int(f,a,b)
int(f,v,a,b)

级数求和
symsum(f,v,a,b): f关于变量v的级数和v从a取到b
symsum(f,a,b): 默认变量

积分变换
Fourier变换/反变换
.....没学，不会，告辞

Taylor级数
taylor(f): 返回关于默认变量v(v=findsym(f))的6阶Maclaurin多项式(在v=0附近)近似式
taylor(f,n,v): 返回关于变量v的n-1阶麦克劳林展开式(v=0处)
taylor(f,n,v,a): 返回关于变量v的n-1阶麦克劳林展开式(v=a处)

符号方程求解
solve(f1,f2,...)
solve('eq1','eq2',...,'v1','v2',...)
```

**符号函数可视化**

```matlab
绘制曲线
ezplot('x^2*y+y+2')  二维
ezplot3('sin(t)','cos(t)','t',[0,6*pi])  三维

绘制等高线，自动添加标题和坐标轴标准 二维
ezcontour 绘制普通等高线
ezcontourf 绘制带填充颜色的等高线

ezmesh 绘制普通三维网格图
ezmeshc 绘制带等位线的三维网格图

ezsurf 绘制普通三维曲面图
ezsurfc 绘制带等位线的三维曲面图

ezpolar 绘制二维极坐标曲线
```



## 6、图形绘制

**基本二维图形**

```matlab
plot(Y)
```



## 7、Simulink

**流程：**创建空白模型，添加模块，添加连接，仿真配置，运行仿真，保存模型

**仿真算法设置：**仿真时间设置、算法设置

**算法设置：**固定步长参数设置、变步长参数设置

**Simulink子系统作用：**

1、使复杂系统模型更加简洁，可读性高

2、子系统可以反复利用，节省建模时间

**策略：**

1、bottom-up（自下而上）

​		压缩子系统：先添加模块，再将模块组合到子系统中

2、top-down（自上而下）

​		子系统模块：先构建空白子系统，再把子系统块所包含的模块添加进去



## 8、图像处理

**模拟图像：**光学图像，空间坐标和明暗程度连续变化，计算机无法直接处理，不便于存储、复制、传输

**数字图像：**便于计算机存储、处理、使用，空间坐标和明暗程度不连续，用离散数字表示，具有一定的信息损失

**图像获取的三种途径：**摄影成像、扫描成像、雷达成像

**图像数字化过程三个步骤：**采样、量化、编码

**采样：**（空间离散），空间中连续的图像变化成离散点的操作，实际是空间坐标的数字化（采样网格的大小关系到图像的质量及所包含的信息）

**量化：**（灰度离散），指使用多大范围的数值来表示图像采样后的每一个点。量化的结果是图像能容纳的颜色总数，反映了采样的质量（量化的大小关系到图像的质量及所包含的信息）

**编码：**实现图像传输与存储的关键，熵编码、预测编码、变换编码、混合编码、小波变换图像压缩编码

**根据采样数目及其特性，数字图像分为五类：**二值图像、灰度图像、彩色图像、立体图像（stereo image，从不同角度拍摄的一对图像，可用来计算深度信息）、三维图像（一组二维图像组成，每幅图像表示物体的一个横截面）

**矢量图：**一系列计算机指令来描述和记录，可分解为一系列子图如点线面等，容易放大缩小旋转，不易失真，精确度高，可绘制3D图像，不易做成色彩丰富图像

**点阵图/位图：**用像素点描述或映射，也叫位映射图，这些位定义每个像素点的颜色和亮度，随颜色数和分辨率提高，存储空间增大，较易失真

**颜色数据类型：**double 64位 [0,1]  uint8 [0,255]

**图像类型及数据结构：**真彩图像(RGB img, m×n×3矩阵)、索引图像(把像素值作为RGB调色板下标，包含两个结构，调色板map(p*3, double/uint8)和图像数据矩阵X(m×n))、灰度图像(intensity img，就一个数据矩阵(m×n)，double/uint8)、二值图像(就一个数据矩阵(m×n)，0或1)、图像序列(四维数组(长、宽、颜色深度、帧序号))

```matlab
%将多帧图像A1、A2、A3、A4、A5连接成图像序列，各图像尺寸必须相同
A = cat(1, A1, A2, A3, A4, A5) %按列连接(列数相同)
A = cat(2, A1, A2, A3, A4, A5) %按行连接(行数相同)
A = cat(3, A1, A2, A3, A4, A5) %按矩阵连接(行列数相同)
A = cat(4, A1, A2, A3, A4, A5) %4维  提取其中一帧如第2帧：A(:,:,:,2)
```

**图像数据类型转换：**如索引图像滤波时，必须转换为RGB真彩图像

**图像文件输入输出：**

```matlab
imread: 读取图片文件中的数据

一般图像：A = imread('filename.fmt','fmt') 或 A = imread('filename.fmt')
索引图像：[A,map] = imread('filename.fmt','fmt')

一般图像：uint8
索引图像：图像阵列uint8/uint16 , map:double 64
```

```matlab
imwrite: 将图像数据A写入图像文件filename.fmt中

一般图像：imwrite(A,'filename.fmt','fmt') 或 imwrite(A,'filename.fmt')
索引图像：imwrite(A,map,'filename.fmt','fmt')

保存数据类型：uint8
```

```matlab
imfinfo: 从图像文件中查询其信息
imfinfo('filename.fmt')
```

```matlab
imshow 显示图像

灰度图像：
imshow(I)
imshow(I,n) % n为显示灰度级数目，缺省为256
imshow(I,[low high]) % [low high]为图像数据的值域, 低于low的全黑，高于high的全白
imshow(I,[]) % 默认显示范围为[min(I(:)),max(I(:))]

二值图像：
imshow(BW)
imshow(~Bw) %取反

索引图像：
imshow(X,map)
	%map: p*3 [0,1]
	%X: double/uint8
	%其中索引值大于等于map的色数的都显示为map中最后一个颜色
示例：
X = imread('cameraman.tif');imshow(X);colorbar;%显示颜色条
map = pink(256);% 更换调色板
figure,imshow(X,map);colorbar;

真彩色图形：
imshow(RGB) %m*n*3 故总共有 2^(8*3) = 256^3 = 2^24
特殊示例：
img = imread('i.img')
% 调整三色的顺序
imshow(img(:,:,[1 2 3])) % R G B
imshow(img(:,:,[3 2 1])) % B G R
imshow(img(:,:,[3 1 2])) % B R G

% 也可直接从磁盘显示图像
imshow filename.fmt %无需引号
imshow('filename.fmt')

figure：多幅图像显示
创建新的图像窗口，每个图像显示在一个窗口中
figure/figure(n),imshow

subplot: 多子图图像显示
subplot(m,n,k),imshow
```

其他函数

<img src="C:\Users\yang\AppData\Roaming\Typora\typora-user-images\image-20201130215611235.png" alt="image-20201130215611235" style="zoom:33%;" />

```matlab
load save 装载和存储数据

lena = imread('lena.jpg');imshow(lena)
save lena %保存图像数据，生成lena.mat
clear;
load lena;
figure,imshow(lena)
```

```matlab
%图像的代数运算

imadd(I,J) % 图像的加法运算 尺寸和数据类型需一致 若加后超出范围 则 < 0 ? 0    > 255 ? 255
% 其中参数I或J也可以为单个整数，则将矩阵中每一项都加上这个整数
imadd(I,J,'fmtstr') % 'fmtstr'为数据类型字符串 如 'uint16'
示例：
对于 I %256*256*1
和   J %220*220*3
将 J同化为I
J = J(:,:,1); %变为单色
J = imresize(J,length(I)/length(J)); %修改尺寸
或 J = imresize(J,[256,256]);
K = imadd(I,J,'uint16');

imsubtract(I,J) %尺寸和数据类型需一致 若减后超出范围 则 < 0 ? 0    > 255 ? 255
% 其中参数I或J也可以为单个整数，则将矩阵中每一项都减去这个整数
imsubtract(I,50) %图像整体亮度减小

%乘法
immultiply(I,n)  %亮度缩放
immultiply(I,mask)  %掩模运算
%亮度缩放
I = immultiply(I,0.5)
I = immultiply(I,2)
%掩模运算
Img = imread('pears.png')
Mask = imread('PearMask.bmp')
PearR = immultiply(Img(:,:,1),Mask);
PearG = immultiply(Img(:,:,2),Mask);
PearB = immultiply(Img(:,:,3),Mask);
Pear = cat(3,PearR,PearG,PearB);

%除法
imdivide(I,n)  %亮度缩放  乘法的逆
imdivide(I,J)  %除掉背景

%直接线性运算
I = imread('...')
J = (double(I)) * 1.5 + 30
imshow(uint8(J))
K = (double(I)) * 0.5
imshow(uint8(K))
```

**图像的几何变换：**

```matlab
B = imtransform(I,T)
% I: 要变换的图像
% T: 由 maketform 函数产生的变换结构，根据变换结构的不同，可以实现不同的空间变换，如二维仿射变换、投影变换
B = imtransform(I,TFORM,interpmethod)
% I: 待变换的输入图像
% B: 变换后的输出图像
% TFORM: 由maketform函数产生的变换结构
% interpmethod 为插值方法，三选一：'bicubic'(双三次插值),'bilinear'(双线性插值),'nearest'(最近邻插值(默认))
maketform %变换结构生成函数
TFORM = maketform('transformtype', Matrix)
% transformtype 指定变换类型
% 包括 affine(仿射变换) projective(投影变换) custom(自定义函数进行变换) box(依靠函数中的另外参数产生仿射变换结构) composite(多次调用tformfwd功能来实现)
% Matrix为相应的仿射变换矩阵

仿射变换：
[x',y',1] = [x,y,1][a_11 a_12 0; a_21 a_22 0; a_31 a_32 1]
平移：[1 0 0;
	  0 1 0;
      a_31 a_32 1]
镜像：[(-)1 0 0;
	  0 (-1) 0;
      0 0 1]
比例缩放：[a_11 0 0;
		 0 a_22 0;
         0 0 1]
旋转：[cosθ -sinθ 0;
	  sinθ cosθ 0;
      0 0 1] % 顺时针旋转θ度
      
imrotate 图像旋转
B = imrotate(A,angle)
B = imrotate(A,angle,method,'crop')
% angle 为旋转角度，正值为逆时针旋转
% method 为插值方法
% 'crop' 裁剪旋转后增大的图像，保持和原图同样大小；否则默认为比例缩放

imresize 图像大小调整
B = imresize(A,m) % m为缩放的倍数
B = imresize(A,m,method)
B = imresize(A,[mrows ncols],method) % [mrows ncols] 变换后图像的高和宽

投影变换：
[x_c,y_c,w_c] = [x,y,1][a_11 a_12 a_13; a_21 a_22 a_23; a_31 a_32 a_33]
% w_c不为1时，要进行齐次除法
% 仿射变换 是一种特殊的 投影变换

图像矩形区域裁剪：
imcrop 剪切图像中的一个矩形子图
pc = imcrop(p) % 用鼠标选取矩形 p:输入图像 pc:输出图像
pc = imcrop(p,rectangle) % rectangle 为 [left,bottom,width,height]
特殊示例：
imshow(p)
imcrop % 开启鼠标裁剪

图像非规则多边形区域裁剪
roipoly
pc = roipoly(p) % 鼠标选取多边形顶点
pc = roipoly(p,mat_c,mat_r) % mat_c 和 mat_r 分别是ROI的顶点对应的列坐标和行坐标矩阵或数组(按顺序排列)
示例：
Img = imread('pears.png')
bw = roipoly(Img) % 鼠标选定一个多边形区域
r = Img(:,:,1);g = Img(:,:,2);b = Img(:,:,3); % 获取原图的 r g b 矩阵
cr = bw.*double(r);cg = bw.*double(g);cb = bw.*double(b); % 
J = cat(3,uint8(cr),uint8(cg),uint8(cb));
imshow(J)

图像亮度调整：
g = imadjust(f)
g = imadjust(f, [low_in high_in], [low_out high_out], gamma)
% [low_in high_in] 被执行变换操作的灰度范围 double 0.0~1.0
% [low_out high_out] 图像中的像素变换后被映射到 low_out ~ high_out 的灰度级上 double 0.0~1.0
% gamma 变换映射的方式 默认1 为线性映射，变换前后的灰度级没有被加权
% 当gamma>1 映射被加权至更高的灰度级
% 当gamma<1 映射被加权至更低的灰度级

图像灰度直方图 imhist
统计各个灰度像素的分布概率，是灰度级的函数，反映不出该像素在图像中的二维坐标
通过灰度直方图的形状，可以判断该图像的清晰度和黑白对比度
h = imhist(Img,b)
h = imhist(Img)
% b 直方图统计时显示的整个灰度级分段的数目，省略时表明灰度级不分段

图像的直方图均衡化 histeq
把一幅已知灰度概率分布图像中的像素灰度级做某种映射变换，使它变成一幅具有均匀概率分布的新图像，是图像视觉效果更加清晰
g = histeq(Img,outlev)
% outlev为输出图像灰度级，默认64个灰度级 通常将其赋值为256，即全灰度级

图像滤波：平滑滤波、锐化滤波

线性空域滤波：
imfilter
hp = imfilter(p,w,filter_mode,boundary_options,size_options)
% p 原图像
% w 滤波模板
% filter_mode 指定滤波中使用相关核corr还是卷积核conv
% boundary_options 控制边界填充方式为 边界复制replicate、边界循环circular、边界对称symmetric
% size_options 取 same 或者 full

预定义滤波器/模板
fspecial
h = fspecial('type',para)
% h 为预定义的滤波器
% para 为与滤波器相关的参数
% type 滤波器的种类
% gaussian、laplacian、log(拉普拉斯高斯算子)、prewitt、sobel、average、unsharp

二维中值滤波：
medfilt2
hp = medfilt2(p,[m n],padopt)
% m n 规定了邻域大小
% padopt 指定了边界填充方式，默认方式为zeros

图像噪声模拟函数
imnoise
pn = imnoise(p,'type',para)
% type 噪声类型 gaussian、salt&pepper(椒盐噪声(二值分布))、speckle(均值为0均匀分布的随机噪声)
% para 每种类型噪声的参数

图像边缘检测与分割
利用一阶导数最大值或二阶导数过零点来判断
相关算子：Roberts、Sobel、Prewitt、LoG、Canny
edge函数
BW = edge(I)
% 输入I是一个灰度或二值化图像，返回一个与I相同大小的二值化图像BW，在检测到边缘的地方为1，其他地方为0
BW = edge(I,option,thresh,direction)
% 根据敏感度阈值thresh，在所指定的方向direction上，用option指定的算子进行边缘检测
[BW,thresh] = edge(I,option,...)
% 自动选择阈值用option指定算子进行边缘检测，返回阈值

imcontour 轮廓提取
[C,handle] = imcontour(I,n)
[C,handle] = imcontour(I,v)
% C 返回的轮廓位置坐标，n为灰度级的个数，v为用户指定的所选的等灰度级向量

阈值分割算法
阈值选取方法：极小值点阈值、迭代阈值、最大方差阈值(也称Otsu自动阈值处理方法，thresh = graythresh(p))

特定区域增强处理 roifilt2
I = imread('...')
BW = roipoly(I)
H = fspecial('unsharp')
J = roifilt2(H,I,BW)
imshow(J)

特定区域填充处理 roifill
load trees
I = ind2gray(X,map)
figure,imshow(I)
J = roifill;
figure,imshow(J)

直线检测
Hough变换
基本思想：点-线对偶性
hough函数
[H,theta,rho] = hough(BW)
[H,theta,rho] = hough(BW,'RhoResolution',n,'Theta',ThetaVetor)
% H 霍夫变换矩阵 theta以度计和rho是ρ、θ的向量，在这些值上产生霍夫变换
% BW是二值图像，n指定rho的采样步长间隔，默认1，ThetaVector指定Theta的采样区间，默认-90:89
houghpeaks: 在霍夫变换矩阵中找极值点
peaks = houghpeaks(H,numpeaks)
peaks = houghpeaks(H,numpeaks,'Threshold',vall,'NHoodSize',val2)
% numpeaks峰值个数
% val1 非负标量
houghlines：从霍夫变换矩阵中提取线段
lines = houghlines(BW,theta,rho,peaks)
```



## 9、优化问题

**可行解/可行域：**满足所有约束条件的向量x*为**可行解/点**，全体**可行点**的集合称为**可行集/域**, 记为**D**

在**可行集**里找到一点x*，使f(x)在该点取最小的过程即为**最优化**的求解过程，x\*称为**最优点/最优解**，f(x\*)称为**最优值**

**整体/全局最优解**、**局部最优解**

优化问题分类：约束型、非约束型

细分：线性、非线性、整数型、混合整数型、多目标

**优化模型要求：**目标函数最小化 +  约束非正



**无约束最优化问题**

```matlab
fminbnd: 单变量无约束优化
[x,fval,exitflag,output]=fminbnd(fun,x1,x2)
% fun : 函数名
% x1 x2：指定的搜索范围
% x：最优点
% fval：最小值点处的函数名，即最优值，可省略
% exitflag：取1表示计算成功，可省略
% output：一个结构数组，记录计算过程参数，可省略

多变量无约束优化：
fminsearch: 利用单纯形原理，适合处理 阶次低 但是 间断点 多的函数
fminunc: 利用拟牛顿法原理，适合 高阶连续 的函数
两函数格式完全相同，都容易陷入局部优化，结果的正确与否取决于初值点x0的选取
[x,fval,exitflag,output]=fminsearch(fun,x0)
% x0 为每个变量的初值点，为一个列向量
% fun编写过程中，要将各个变量写成一个向量的各分量形式，即x(1),x(2),...并且方程组要以多行一列的矩阵形式来表示
示例：
单一变量：
(1) ffi.m M-函数
function y=ff1(x)
y = exp(x)-x^3-4*x^2;

调用：x = fminsearch('ff1',1)
(2) 函数表达式
x = fminsearch('exp(x)-x^3-4*x^2',1)
(3) 内联函数
g = inline('exp(x)-x^3-4*x^2','x');
x = fminsearch(g,1)
多变量：
(1) M-函数
function y=ff2(x)
y = (x(1)^2-2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2));

x = fminsearch('ff2',[1,1])
(2) 函数表达式
x = fminsearch('(x(1)^2-2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2))',[1,1])
(3) 内联函数
g = inline('(x(1)^2-2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2))','x')
x = fminsearch(g,[1,1])
```

**线性规划问题**

```matlab
linprog
[x,fval,flag,output]=linprog(f,A,b,Aeq,beq,vlb,vub,x0,option,p1,p2,...)
% f为系数向量
% f,A,b,Aeq,beq,vlb,vub 都不能缺省，不存在约束则用[]填充
% x0 为初始搜索点，可省略
% option,p1,p2,...等附加参数都可省略
最简形式：
x = linprog(f,A,b,Aeq,beq,vlb,vub)
```

**非线性规划问题**

```matlab
fmincon
[x,fval,flag,output]=fmincon(fun,x0,A,b,Aeq,beq,vlb,vub,CF,option,p1,p2,...)
% fun: 目标函数,用M-函数则要加单引号 或 用@fun句柄表示，inline则不用加，或直接字符串符号表达式
% CF：给非线性约束函数写的M-函数，引用需要加单引号 或 用@fun句柄表示
最简形式：x=fmincon(fun,x0,A,b,Aeq,beq,vlb,vub,CF)

CF:
function [c,ceq]=CF(x)
c = (x(1)-1)^2-x(2); % 若不存在不等式约束，则 c=[]
ceq = x(1)^2+x(2)^2+x(3)^2-25; % 若不存在等式约束，则取 ceq=[]
```

**0-1(线性)规划问题**

```matlab
bintprog
x = bintprog(f,A,b,Aeq,beq,x0)
```

**二次规划**

约束条件全为线性并且目标函数是二次函数的最优化问题

```matlab
[x,fval,flag,output]=quadprog(H,C,A,b,Aeq,beq,vlb,vub,x0)
```

**多目标规划**

```matlab
非劣解/非支配解/Pareto解
一组目标函数最优解的集合称为Pareto最优集
最优集在空间上形成的曲面称为Pareto最优前沿面

将多目标转化为单目标规划问题
方法：
1、线性加权法：
每个目标分配一个权值
对权系数的要求：归一化、非负
2、主要目标法：
确定一个主要目标，其余目标选取一定阈值，作为约束处理
3、极小极大法：
让每一个极小目标中最大的目标函数值尽可能地小，先求出目标函数中的最大值，然后求最大值的最小值
fminmax函数
[x,fval,maxfval,exitflag,output,lambda]=fminmax(f,x0,A,b,Aeq,beq,vlb,vub,CF,...)
% maxfval: 解x处函数最大值，即maxfval=max{fun(x)}
% lambda: 解x处的拉格朗日乘子
4、目标到达法：
为每一个目标确定一个期望目标fi，一个权重wi，设置一个松弛因子γ
fgoalattain函数
[x,fval,attainfactor,exitflag]=fgoalattain(f,x0,goal,weight,A,b,Aeq,beq,vlb,vub,CF)
% wieght: 权重系数
% goal: 期望目标
% attainfactor: 变量是否超过或低于目标个数；若为负，则目标已溢出；若为正，则目标个数未达到
5、多目标遗传算法
gamultiobj函数
```

