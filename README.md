# instantMPC

instantMPCの以下の文献を元に実装した

数値シミュレーションにおける目的関数$`f(z) = (z-r)^\top F(z-r)`$の次元が正しくなかった
($`z \in \mathbb{R}^{(m+n)N}, r\in \mathbb{R}^2`$)ため，
- 未来における入力を0
- 状態($`x(t, 1), \ldots, x(t, N)`$)をすべて$`r`$に保つ

ように目標値の形を変更した．

また，目的関数における入力の重みを文献通り設定すると定常偏差が残ったため，重みを小さく($`\times 0.01`$など)して定常偏差を減らしている．

## Usage
1. Open as simulink project(instantMPC.prj)
2. Execute main

## Reference
- [Instant MPC for Linear Systems and Dissipativity-Based Stability Analysis](https://ieeexplore.ieee.org/document/8718794/)
