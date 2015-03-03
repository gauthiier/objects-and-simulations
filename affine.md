---
layout: math
title: Environment
---

## Affine Transforms & Vector Math

	class Transformable {
	  
	  // attaributes
	  PVector _position;
	  float   _rotation;
	  float   _scale;

	  ...

	public void display() {
	    pushMatrix();
	    translate(_position.x, _position.y);
	    rotate(_rotation);        
	    scale(_scale);
	    draw_shape();
	    popMatrix();
	 }	 
	 
	 ...

	};

---

What is a geometry / shape?

![](http://onemathematicalcat.org/Math/Geometry_obj/graphics/vertex_vertices.png)

---

What types of (2D / 3D) transformations can we apply to geometries / shapes?

![](http://resources.esri.com/help/9.3/arcgisdesktop/com/gp_toolref/coverage_tools/transform_arc3.gif)

---

<!-- ASCIImath -->

What is a matrix Matrix?

$
[[a, b, c], [d, e, f], [g, h, i]]
$


Matrix [3 x 3] multiplication with a Vector [1 x 3]

$
[[a, b, c], [d, e, f], [g, h, i]] [[x], [y], [z]] = [[ax + by + cz], [dx + ey + fz], [gx + hy + iz]]
$

---

What types of geometrical transformations (vertices transformation) can we perform using a Matrix?


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

---

What is an Affine Transform?

Affine Transform Matrix comprises a Translation, Scaling, Rotation and Shearing

$
[[sx * cos theta, -sin theta * shx, tx], [sin theta * shy, sy * cos theta, ty], [0, 0, 1]]  [[x], [y], [1]] = [[dot x], [dot y], [1]]
$

Yes, but what other types of transformations exists?

![](https://geodata.ethz.ch/resources/tutorials/L3GeodataAndSpatialRelation/en/images/transformation.png)




