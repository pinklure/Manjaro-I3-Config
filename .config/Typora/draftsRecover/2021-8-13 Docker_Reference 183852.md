### 16 位结构的 CPU

#### 结构特性

- 运算器一次最多可以处理 16 位的数据
- 寄存器的最大宽度为 16 位
- 寄存器和运算器之间的通路为 16 位

### 8086 CPU

- 地址总线 20 位， 寻址能力 1MB
- 基础地址(16 位的倍数) + 偏移地址 = 物理地址
- ![image-20210813151018747](/home/sinow/.config/Typora/typora-user-images/image-20210813151018747.png)



### DOSBOX debug 操作

- R 查看、寄存器的值
  - ![image-20210813163150442](/home/sinow/.config/Typora/typora-user-images/image-20210813163150442.png)
- D 查看 内存
  - ![image-20210813163336655](/home/sinow/.config/Typora/typora-user-images/image-20210813163336655.png)
  - ![image-20210813163352417](/home/sinow/.config/Typora/typora-user-images/image-20210813163352417.png)
- E 修改 内存
  - ![image-20210813163528254](/home/sinow/.config/Typora/typora-user-images/image-20210813163528254.png)
  - ![image-20210813163541607](/home/sinow/.config/Typora/typora-user-images/image-20210813163541607.png)
  - ![image-20210813163608383](/home/sinow/.config/Typora/typora-user-images/image-20210813163608383.png)
  - ![image-20210813163908781](/home/sinow/.config/Typora/typora-user-images/image-20210813163908781.png)
- U 查看内存中机器码含义
  - ![image-20210813164113804](/home/sinow/.config/Typora/typora-user-images/image-20210813164113804.png)
- T 执行 CS:IP 处指令
  - ![image-20210813164439395](/home/sinow/.config/Typora/typora-user-images/image-20210813164439395.png)

- A 以汇编指令在内存中加入机器指令
  - ![image-20210813164609012](/home/sinow/.config/Typora/typora-user-images/image-20210813164609012.png)
  - 







### 通用寄存器

- AX、BX、CX、DX
- 用来存放一般性数据
- 都是 16 位寄存器
- AX 分为 AH（高8位，8~15位）、AL (低8位，0~7位)
- BX 分为 BH、BL
- CX 分为 CH、CL
- DX 分为 DH、DL

![image-20210813145858867](/home/sinow/.config/Typora/typora-user-images/image-20210813145858867.png)



- 字节 byte 由8个bit 组成
- 字 word 由两个字节组成
- ![image-20210813150308712](/home/sinow/.config/Typora/typora-user-images/image-20210813150308712.png)







| 汇编指令   | sa   |
| ---------- | ---- |
| mov ax, 18 |      |
| mov ah, 78 |      |
| add ax, 8  |      |
| mov ax, bx |      |
| add ax, bx |      |



### 段寄存器

- CS、DS、SS、ES

- CS 代码段寄存器，IP 指令指针寄存器
- mov 指令 不能用于设置 CS、IP 的值，需要使用 jmp指令

| 汇编指令   | 效果               |
| ---------- | ------------------ |
| jmp 2AE3:3 | CS=2AE3H, IP=0003H |
| jmp 3:0B16 | CS=0003H, IP=0B16H |

- 仅修改 IP

| 汇编指令 | 效果                         |
| -------- | ---------------------------- |
|          | ax=1000H, CS=2000H, IP=0003H |
| jmp ax   | ax=1000H, CS=2000H, IP=1000H |
|          | bx=0B16H, CS=2000H, IP=0003H |
| jmp bx   | bx=0B16H, CS=2000H, IP=0B16H |
