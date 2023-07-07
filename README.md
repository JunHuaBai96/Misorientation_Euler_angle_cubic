# Misorientation_Euler_angle_cubic
从欧拉角（Euler angle）计算取向差（misorientation）

## 计算步骤
第一步：分别将两组欧拉角转化成取向矩阵g1 和g2
![微信截图_20230707123523](https://github.com/JunHuaBai96/Misorientation_Euler_angle_cubic/assets/102909786/6106804d-4a12-4bac-8278-8659007a9eb4)

第二步，计算旋转矩阵 r12， 即g2乘以g1的逆矩阵。

第三步，对矩阵进行线性变换，使得其对角元素为其所在行和列的最大值 [2]，记矩阵元素为r_ij.

立方晶系对称操作太多，对应同一个旋转矩阵，有1000多种旋转可能。计算取向差一般都是角度最小的那个旋转角度及其对应的旋转轴。另外，如果将对角元素从11到33按照从大到小排列，则旋转轴的三个指数也是从大到小排列。[3]

第四步 根据第三步得到的旋转矩阵，得出旋转角和旋转轴

## 注意事项
1）此处只是讨论已知两组欧拉角之后，如何计算晶粒的取向差，关于如何从ebsd处理软件得到对应晶粒的欧拉角，请自行查找相关资料；

2）此处仅讨论立方系。

3）输入两组欧拉角(单位为度，非弧度值)，例如：A1=[281.7 33.3 2.7]

## 运行环境
Windows 10，MATLAB R2016a

## 参考文献
[1] 杨平，电子背散射衍射技术及其应用.

[2] w. bollmann, crystal lattices, interfaces, matrices: an extension of crystallography.

[3] http://muchong.com/t-13026966-1-authorid-15867235
