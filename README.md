# instantMPC

instantMPCの以下の文献を元に実装した

数値シミュレーションにおける目的関数（$f(z) = (z-r)^\top F(z-r)$）の次元がおかしかった（$z \in \mathbb{R}^{(m+n)N}, r\in \mathbb{R}^2$）ので，未来における入力を0，状態（$x(t, 1), \ldots, x(t, N)$）をすべて$r$に保つように目標値の形を変更した．
また，目的関数における入力の重みを文献通りにすると定常偏差が残ってしまったため，重みを小さく（$\times 0.01$など）して定常偏差を無くした．

## Requirements
MATLAB R2022b
- Simulink

## tools
remove cache files
```sh
./tools/rm_sim_cache.sh
```

## Reference
```bib
@ARTICLE{8718794,  author={Yoshida, Keisuke and Inoue, Masaki and Hatanaka, Takeshi},  journal={IEEE Control Systems Letters},   title={Instant MPC for Linear Systems and Dissipativity-Based Stability Analysis},   year={2019},  volume={3},  number={4},  pages={811-816},  doi={10.1109/LCSYS.2019.2918095}}
```
