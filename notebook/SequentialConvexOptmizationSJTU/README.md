# 最优化与最优制导

简答加一个计算（推导公式）

## 1. What is guidance

制导问题的关键词有：

* 轨迹
* 飞行器动力学（主要是平动）
* Select Commands
* 当前状态和期望状态
* 约束

典型的制导问题有：

* Reference trajectory tracking
* Homing guidance (Missile)
* On-line trajectory generation

控制和制导的区别：

| 控制           | 制导           |
| -------------- | -------------- |
| 力和力矩       | 实现机动       |
| 姿态和飞行状况 | 输出给控制单元 |
| 稳定性         | 速度和加速度   |

