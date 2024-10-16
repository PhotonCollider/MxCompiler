/*
Test Package: Codegen
Author: 14' Xingyuan Sun
Time: 2020-02-03
Input:
=== input ===
=== end ===
Output:
=== output ===
(0, 0, 0)
28716325
7421636
9980404
38464544
1854392
(7616, 1666188, -1232986)
(-508, 4119, 3390)
(562, 1584, 2144)
(-920, 768, -524)
(612, -469, -630)

=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codegen Pretest-901
*/
#include <cstdio>

class point {
public:
	int x;
	int y;
	int z;
	point() {
		x = 0;
		y = 0;
		z = 0;
	}
	void set(int a_x, int a_y, int a_z) {
		x = a_x;
		y = a_y;
		z = a_z;
	}
	int sqrLen() {
		return x * x + y * y + z * z;
	}
	int sqrDis(point other) {
		return (x - other.x) * (x - other.x) + (y - other.y) * (y - other.y) + (z - other.z) * (z - other.z);
	}
	int dot(point other) {
		return x * other.x + y * other.y + z * other.z;
	}
	point cross(point other) {
		point retval;
		retval.set(y * other.z - z * other.y, z * other.x - x * other.z, x * other.y - y * other.x);
		return retval;
	}
	point& add(point other) {
		x = x + other.x;
		y = y + other.y;
		z = z + other.z;
		return *this;
	}
	point& sub(point other) {
		x = x - other.x;
		y = y - other.y;
		z = z - other.z;
		return *this;
	}
	void printPoint() {
		printf("(%d, %d, %d)\n", x, y, z);
	}
};

int main() {
	point a, b, c, d;
	a.printPoint();
	a.set(849, -463, 480);
	b.set(-208, 585, -150);
	c.set(360, -670, -742);
	d.set(-29, -591, -960);

	a.printPoint();
	b.printPoint();
	c.printPoint();
	d.printPoint();

	a.add(b);
	b.add(c);
	d.add(c);
	c.sub(a);
	b.sub(d);
	d.sub(c);
	c.add(b);
	a.add(b);
	b.add(b);
	c.add(c);
	a.sub(d);
	a.add(b);
	b.sub(c);
	printf("results:\n");
	printf("%d\n", a.sqrLen());
	printf("%d\n", b.sqrLen());
	printf("%d\n", b.sqrDis(c));
	printf("%d\n", d.sqrDis(a));
	printf("%d\n", c.dot(a));
	b.cross(d).printPoint();
	a.printPoint();
	b.printPoint();
	c.printPoint();
	d.printPoint();
	return 0;
}
