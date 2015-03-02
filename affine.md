---
layout: math
title: Environment
---

## Affine Transforms & Vector Math

<!-- ASCIImath -->

Matrix multiplication  
$
[[a, b, c], [d, e, f], [g, h, i]] [[x], [y], [z]] = [[ax + by + cz], [dx + ey + fz], [gx + hy + iz]]
$


Translation  
$
[[1, 0, tx], [0, 1, ty], [0, 0, 1]]  [[x], [y], [1]] = [[dot x], [dot y], [1]]
$

Scaling  
$
[[sx, 0, 0], [0, sy, 0], [0, 0, 1]]  [[x], [y], [1]] = [[dot x], [dot y], [1]]
$

Rotation $theta$  
$
[[cos theta, -sin theta, 0], [sin theta, cos theta, 0], [0, 0, 1]]  [[x], [y], [1]] = [[dot x], [dot y], [1]]
$

Shearing  
$
[[1, shx, 0], [shy, 1, 0], [0, 0, 1]]  [[x], [y], [1]] = [[dot x], [dot y], [1]]
$

Affine Transform (Translation + Scaling + Rotation + Shearing)  
$
[[sx * cos theta, -sin theta * shx, tx], [sin theta * shy, sy * cos theta, ty], [0, 0, 1]]  [[x], [y], [1]] = [[dot x], [dot y], [1]]
$




