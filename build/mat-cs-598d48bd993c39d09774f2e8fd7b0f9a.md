# 📐 Mathematics Cheatsheet

> A comprehensive reference guide for trigonometry, algebra, linear equations, and discrete mathematics.
- [html](https://ophelialabs.github.io/restructured/content/resources/mat-cs/mat-cs.html)
- [jl](https://ophelialabs.github.io/restructured/content/resources/mat-cs/mat-cs.jl)

---

## 📑 Quick Navigation

### 🔵 Trigonometry
| Subtopic | Link |
|----------|------|
| Core Definitions | [SOHCAHTOA](#core-definitions-sohcahtoa) |
| Identities | [Pythagorean & Reciprocal](#reciprocal-and-ratio-identities) |
| Angle Formulas | [Compound, Double, Half Angle](#compound-angle-formulas) |
| Triangles | [General Triangles & Solving](#general-triangles-non-right) |
| Inverse Functions | [Arcsine, Arccosine, Arctangent](#inverse-trigonometric-functions) |
| Series & Expansion | [Taylor & Fourier Series](#trigonometric-series--expansion) |

### 📈 Linear Functions
| Subtopic | Link |
|----------|------|
| Standard Forms | [All Forms at a Glance](#standard-forms-at-a-glance) |
| Slope & Lines | [Slope Analysis & Relationships](#slope-analysis) |
| Distance & Midpoint | [Formulas](#distance--midpoint-formulas) |
| Systems | [Linear Systems Methods](#systems-of-linear-equations-methods) |
| Matrices | [Matrix Operations & Properties](#matrices-and-matrix-operations) |
| Eigenvalues | [Eigenvalues & Eigenvectors](#eigenvalues--eigenvectors) |

### ⬜ Quadratic Functions
| Subtopic | Link |
|----------|------|
| Standard Form | [Quadratic Equation](#standard-form) |
| Solving Methods | [Quadratic Formula & Discriminant](#the-quadratic-formula) |
| Vertex Form | [Vertex & Parabola Properties](#vertex-form) |
| Conic Sections | [Ellipses, Hyperbolas, Parabolas](#conic-sections) |

### 🔤 Algebra
| Subtopic | Link |
|----------|------|
| Polynomials | [Polynomial Operations](#polynomial-operations) |
| Factoring | [Factoring Techniques](#factoring-techniques) |
| Rational Expressions | [Operations & Simplification](#rational-expressions) |
| Exponents & Radicals | [Rules & Radical Expressions](#exponent-rules) |
| Absolute Value | [Absolute Value Equations](#absolute-value-equations) |
| Groups | [Group Theory Basics](#groups) |
| Vector Spaces | [Vector Space Properties](#vector-spaces) |
| Linear Transformations | [Linear Maps & Properties](#linear-transformations) |
| Symmetry Groups | [Permutation & Transformation Groups](#symmetry-groups) |
| Bilinear Forms | [Inner Products & Bilinear Maps](#bilinear-forms) |
| Linear Groups | [General & Special Linear Groups](#linear-groups) |

### 🎲 Discrete Math
| Subtopic | Link |
|----------|------|
| Logic & Sets | [De Morgan's Laws & Set Operations](#logic-and-set-theory) |
| Combinatorics | [Counting & Permutations](#combinatorics-counting) |
| Sequences | [Arithmetic & Geometric Sequences](#number-theory--sequences) |
| Graph Theory | [Graphs, Lemmas & Formulas](#graph-theory) |
| Probability | [Probability Rules & Expected Value](#probability) |
| Boolean Algebra | [Boolean Operations & Laws](#boolean-algebra) |
| Recurrence Relations | [Solving Recurrence Equations](#recurrence-relations) |

---

## 🔵 Trigonometric Functions

### Core Definitions (SOHCAHTOA)

The fundamental trigonometric ratios relate angles in a right triangle to the sides:

```
sin(θ) = Opposite / Hypotenuse    |    cos(θ) = Adjacent / Hypotenuse    |    tan(θ) = Opposite / Adjacent
```

- **Sine (sin)**: $$\sin(\theta) = \frac{\text{Opposite}}{\text{Hypotenuse}}$$
- **Cosine (cos)**: $$\cos(\theta) = \frac{\text{Adjacent}}{\text{Hypotenuse}}$$
- **Tangent (tan)**: $$\tan(\theta) = \frac{\text{Opposite}}{\text{Adjacent}}$$

### Key Components

| Component | Definition |
|-----------|-----------|
| **Hypotenuse** | The longest side, opposite the $90°$ angle |
| **Adjacent** | The side next to the angle in question |
| **Opposite** | The side across from the angle in question |

**Fundamental Relationship**: $$\tan(\theta) = \frac{\sin(\theta)}{\cos(\theta)}$$

### ⚡ Special Angle Values (Quick Reference)

| Angle | Degrees | Radians | $\sin$ | $\cos$ | $\tan$ |
|:-----:|:-------:|:-------:|:-----:|:-----:|:------:|
| Zero | $0°$ | $0$ | $0$ | $1$ | $0$ |
| **30°** | $30°$ | $\frac{\pi}{6}$ | $\frac{1}{2}$ | $\frac{\sqrt{3}}{2}$ | $\frac{\sqrt{3}}{3}$ |
| **45°** | $45°$ | $\frac{\pi}{4}$ | $\frac{\sqrt{2}}{2}$ | $\frac{\sqrt{2}}{2}$ | $1$ |
| **60°** | $60°$ | $\frac{\pi}{3}$ | $\frac{\sqrt{3}}{2}$ | $\frac{1}{2}$ | $\sqrt{3}$ |
| Right | $90°$ | $\frac{\pi}{2}$ | $1$ | $0$ | undefined |

### 🔄 Reciprocal Functions

$$\cot(\theta) = \frac{1}{\tan(\theta)} \quad \sec(\theta) = \frac{1}{\cos(\theta)} \quad \csc(\theta) = \frac{1}{\sin(\theta)}$$

### ✓ Pythagorean Identities

$$\boxed{\sin^2(\theta) + \cos^2(\theta) = 1}$$

$$1 + \tan^2(\theta) = \sec^2(\theta) \quad \text{and} \quad 1 + \cot^2(\theta) = \csc^2(\theta)$$

### 🔗 Compound Angle Formulas

| Function | Addition | Subtraction |
|----------|----------|-------------|
| **sin** | $\sin(A+B) = \sin A\cos B + \cos A\sin B$ | $\sin(A-B) = \sin A\cos B - \cos A\sin B$ |
| **cos** | $\cos(A+B) = \cos A\cos B - \sin A\sin B$ | $\cos(A-B) = \cos A\cos B + \sin A\sin B$ |
| **tan** | $\tan(A+B) = \frac{\tan A + \tan B}{1 - \tan A\tan B}$ | $\tan(A-B) = \frac{\tan A - \tan B}{1 + \tan A\tan B}$ |

### 2️⃣ Double Angle Formulas

$$\sin(2\theta) = 2\sin(\theta)\cos(\theta)$$

$$\cos(2\theta) = \cos^2(\theta) - \sin^2(\theta) = 2\cos^2(\theta) - 1 = 1 - 2\sin^2(\theta)$$

$$\tan(2\theta) = \frac{2\tan(\theta)}{1 - \tan^2(\theta)}$$

### ½ Half Angle Formulas (Power Reduction)

$$\sin^2(\theta) = \frac{1 - \cos(2\theta)}{2} \quad \cos^2(\theta) = \frac{1 + \cos(2\theta)}{2}$$

### 📐 General Triangles (Non-Right)

$$\boxed{\frac{a}{\sin A} = \frac{b}{\sin B} = \frac{c}{\sin C}} \quad \text{(Law of Sines)}$$

$$\boxed{c^2 = a^2 + b^2 - 2ab\cos(C)} \quad \text{(Law of Cosines)}$$

$$\text{Area} = \frac{1}{2}ab\sin(C)$$

### 🎯 Solving Trigonometric Equations

| Equation | General Solution |
|----------|------------------|
| $\sin(\theta) = \sin(\alpha)$ | $\theta = n\pi + (-1)^n\alpha$ |
| $\cos(\theta) = \cos(\alpha)$ | $\theta = 2n\pi \pm \alpha$ |
| $\tan(\theta) = \tan(\alpha)$ | $\theta = n\pi + \alpha$ |

*where $n$ is any integer*

### 🧭 ASTC Rule (Quadrant Signs)

| Quadrant | Functions | Memory |
|----------|-----------|--------|
| **Q1** | All positive | **A**ll |
| **Q2** | sin, csc | **S**ilver |
| **Q3** | tan, cot | **T**ea |
| **Q4** | cos, sec | **C**ups |

### 📱 Inverse Trigonometric Functions

The inverse functions "undo" the original trigonometric functions:

$$\sin^{-1}(x) = \arcsin(x) \quad \cos^{-1}(x) = \arccos(x) \quad \tan^{-1}(x) = \arctan(x)$$

**Domain & Range**:

| Function | Domain | Range |
|----------|--------|-------|
| $\arcsin(x)$ | $[-1, 1]$ | $[-\frac{\pi}{2}, \frac{\pi}{2}]$ |
| $\arccos(x)$ | $[-1, 1]$ | $[0, \pi]$ |
| $\arctan(x)$ | $\mathbb{R}$ | $(-\frac{\pi}{2}, \frac{\pi}{2})$ |

**Key Identity**: $$\sin(\arcsin(x)) = x \quad \cos(\arccos(x)) = x \quad \tan(\arctan(x)) = x$$

### 📈 Trigonometric Series & Expansion

**Taylor Series** (around $x = 0$):

$$\sin(x) = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \cdots$$

$$\cos(x) = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \frac{x^6}{6!} + \cdots$$

$$\tan(x) = x + \frac{x^3}{3} + \frac{2x^5}{15} + \cdots \quad (|x| < \frac{\pi}{2})$$

**Fourier Series** (periodic function decomposition):

$$f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[a_n \cos(nx) + b_n \sin(nx)\right]$$

where $a_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x)\cos(nx) dx$ and $b_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x)\sin(nx) dx$

---

## 📈 Linear Functions and Equations

### 📋 Standard Forms at a Glance

| Form | Equation | Best For |
|------|----------|----------|
| **Slope-Intercept** | $y = mx + b$ | Graphing, identifying slope & intercept |
| **Point-Slope** | $y - y_1 = m(x - x_1)$ | Given a point and slope |
| **Standard** | $Ax + By = C$ | General work, systems |
| **General** | $Ax + By + C = 0$ | Theoretical applications |

### 📊 Slope Analysis

$$m = \frac{\Delta y}{\Delta x} = \frac{y_2 - y_1}{x_2 - x_1}$$

| Type | Slope | Visual |
|------|-------|--------|
| Increasing | $m > 0$ | ↗ |
| Decreasing | $m < 0$ | ↘ |
| Horizontal | $m = 0$ | → |
| Vertical | undefined | ↑ |

### 🔀 Line Relationships

- **Parallel**: $m_1 = m_2$
- **Perpendicular**: $m_1 \cdot m_2 = -1$

### 📍 Distance & Midpoint Formulas

$$\boxed{d = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}} \quad \boxed{M = \left(\frac{x_1 + x_2}{2}, \frac{y_1 + y_2}{2}\right)}$$

### 🔧 Systems of Linear Equations (Methods)

| Method | When to Use |
|--------|------------|
| **Substitution** | One equation easily solves for a variable |
| **Elimination** | Coefficients align well for cancellation |
| **Matrix/Gaussian** | 3+ equations or computational work |

### 📊 Matrices and Matrix Operations

**Basic Matrix**:
$$A = \begin{pmatrix} a_{11} & a_{12} & \cdots & a_{1n} \\ a_{21} & a_{22} & \cdots & a_{2n} \\ \vdots & \vdots & \ddots & \vdots \\ a_{m1} & a_{m2} & \cdots & a_{mn} \end{pmatrix}$$

**Matrix Operations**:

| Operation | Rule |
|-----------|------|
| **Addition** | $(A + B)_{ij} = a_{ij} + b_{ij}$ |
| **Scalar Multiplication** | $(cA)_{ij} = c \cdot a_{ij}$ |
| **Multiplication** | $(AB)_{ij} = \sum_{k} a_{ik}b_{kj}$ |
| **Transpose** | $(A^T)_{ij} = a_{ji}$ |
| **Determinant** | $\det(A)$ (square matrices only) |
| **Inverse** | $A^{-1}$ such that $AA^{-1} = I$ |

**Properties**:
- $(AB)C = A(BC)$ (Associative)
- $AB \neq BA$ (NOT commutative)
- $(AB)^T = B^T A^T$ (Transpose of product)

### 🔍 Eigenvalues & Eigenvectors

For matrix $A$, if $A\mathbf{v} = \lambda \mathbf{v}$ where $\mathbf{v} \neq \mathbf{0}$:

- $\lambda$ is an **eigenvalue**
- $\mathbf{v}$ is an **eigenvector**

**Characteristic Equation**:
$$\det(A - \lambda I) = 0$$

**Finding Eigenvalues**:
1. Compute $\det(A - \lambda I)$
2. Solve the characteristic polynomial
3. Solutions are eigenvalues

**Finding Eigenvectors** (for each eigenvalue $\lambda$):
1. Solve $(A - \lambda I)\mathbf{v} = \mathbf{0}$
2. Non-trivial solutions form the eigenspace

---

## ⬜ Quadratic Functions and Equations

### 📝 Standard Form

$$\boxed{ax^2 + bx + c = 0} \quad (a \neq 0)$$

| Coefficient | Role |
|-------------|------|
| $a$ | Determines parabola direction & width |
| $b$ | Affects axis of symmetry |
| $c$ | Y-intercept |

### 🎯 The Quadratic Formula

$$\boxed{x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}}$$

### 🔍 The Discriminant ($D = b^2 - 4ac$)

| Discriminant | Roots | Graph |
|--------------|-------|-------|
| $D > 0$ | Two distinct real | Two x-intercepts |
| $D = 0$ | One real (repeated) | One x-intercept (tangent) |
| $D < 0$ | Two complex conjugates | No x-intercepts |

### 🛠️ Solving Methods Comparison

| Method | Best For | Speed |
|--------|----------|-------|
| **Factoring** | Simple, factorable trinomials | ⚡⚡⚡ |
| **Square Root** | $x^2 = k$ form (no $bx$ term) | ⚡⚡⚡ |
| **Completing Square** | Vertex form derivation | ⚡⚡ |
| **Quadratic Formula** | Any quadratic, messy numbers | ⚡ |

**Example**: Solve $x^2 - 5x + 6 = 0$
1. Factor: $(x - 2)(x - 3) = 0$
2. Solve: $x = 2$ or $x = 3$

### 📍 Vertex Form

$$\boxed{f(x) = a(x - h)^2 + k}$$

where $(h, k)$ is the vertex (peak or valley)

**Converting** (Completing the Square):
$$y = ax^2 + bx + c \rightarrow y = a\left(x + \frac{b}{2a}\right)^2 + \left(c - \frac{b^2}{4a}\right)$$

### 📐 Parabola Properties

| Property | Formula | Interpretation |
|----------|---------|-----------------|
| **Axis of Symmetry** | $x = -\frac{b}{2a}$ | Vertical line through vertex |
| **Vertex** | $\left(-\frac{b}{2a}, f\left(-\frac{b}{2a}\right)\right)$ | Min/max point |
| **Direction** | $a > 0$ opens ↑, $a < 0$ opens ↓ | Concavity |

### 🎯 Conic Sections

**General Form**: $$Ax^2 + Bxy + Cy^2 + Dx + Ey + F = 0$$

**Classification** (using discriminant $\Delta = B^2 - 4AC$):

| Conic | Condition | Standard Form | Properties |
|-------|-----------|---------------|------------|
| **Circle** | $A = C, B = 0$ | $(x-h)^2 + (y-k)^2 = r^2$ | Center $(h,k)$, radius $r$ |
| **Ellipse** | $\Delta < 0, A \neq C$ | $\frac{(x-h)^2}{a^2} + \frac{(y-k)^2}{b^2} = 1$ | Semi-major axis $a$, semi-minor axis $b$ |
| **Parabola** | $\Delta = 0$ | $(y-k) = a(x-h)^2$ or $(x-h) = a(y-k)^2$ | Focus & directrix equidistant |
| **Hyperbola** | $\Delta > 0$ | $\frac{(x-h)^2}{a^2} - \frac{(y-k)^2}{b^2} = 1$ | Two branches, asymptotes $y = \pm\frac{b}{a}(x-h)+k$ |

---

## 🔤 Algebraic Functions and Equations

### ➕➖ Polynomial Operations

| Operation | Method |
|-----------|--------|
| **Add/Subtract** | Combine like terms |
| **Multiply** | Distributive property or FOIL |
| **Divide** | Long division or synthetic division |

### 🧩 Factoring Techniques

| Technique | Form | Example |
|-----------|------|---------|
| **GCF** | $ab + ac = a(b + c)$ | $3x^2 + 6x = 3x(x + 2)$ |
| **Difference of Squares** | $a^2 - b^2 = (a+b)(a-b)$ | $x^2 - 9 = (x+3)(x-3)$ |
| **Perfect Square** | $a^2 \pm 2ab + b^2 = (a \pm b)^2$ | $x^2 + 4x + 4 = (x+2)^2$ |
| **Sum of Cubes** | $a^3 + b^3 = (a+b)(a^2-ab+b^2)$ | $x^3 + 8 = (x+2)(x^2-2x+4)$ |
| **Difference of Cubes** | $a^3 - b^3 = (a-b)(a^2+ab+b^2)$ | $x^3 - 8 = (x-2)(x^2+2x+4)$ |
| **Trinomial** | $ax^2 + bx + c$ | $2x^2 + 5x + 3 = (2x+3)(x+1)$ |

### 💔 Rational Expressions

$$\frac{a}{b} + \frac{c}{d} = \frac{ad + bc}{bd} \quad \frac{a}{b} \cdot \frac{c}{d} = \frac{ac}{bd} \quad \frac{a}{b} \div \frac{c}{d} = \frac{ad}{bc}$$

### ⚙️ Exponent Rules

$$a^m \cdot a^n = a^{m+n} \quad \frac{a^m}{a^n} = a^{m-n} \quad (a^m)^n = a^{mn}$$

$$(ab)^n = a^n b^n \quad a^{-n} = \frac{1}{a^n} \quad a^{1/n} = \sqrt[n]{a}$$

### √ Radical Expressions

$$\sqrt{a} \cdot \sqrt{b} = \sqrt{ab} \quad \frac{\sqrt{a}}{\sqrt{b}} = \sqrt{\frac{a}{b}} \quad \frac{1}{\sqrt{a}} = \frac{\sqrt{a}}{a}$$

### |x| Absolute Value Equations

**Definition**: $|x| = \begin{cases} x & \text{if } x \geq 0 \\ -x & \text{if } x < 0 \end{cases}$

**Solving** $|ax + b| = c$ (where $c \geq 0$):
$$ax + b = c \quad \text{OR} \quad ax + b = -c$$

### 🎓 Groups

A **group** $(G, \cdot)$ is a set with a binary operation satisfying:

| Axiom | Definition |
|-------|-----------|
| **Closure** | For all $a, b \in G$: $a \cdot b \in G$ |
| **Associativity** | $(a \cdot b) \cdot c = a \cdot (b \cdot c)$ |
| **Identity** | $\exists e \in G$: $a \cdot e = e \cdot a = a$ |
| **Inverse** | For each $a \in G$, $\exists a^{-1}$: $a \cdot a^{-1} = e$ |

**Abelian (Commutative) Group**: Additionally, $a \cdot b = b \cdot a$ for all $a, b$

**Examples**: 
- $(\mathbb{Z}, +)$ - Integers under addition
- $(\mathbb{R}^*, \times)$ - Non-zero reals under multiplication
- $(S_n, \circ)$ - Permutation group of $n$ elements

### 🚀 Vector Spaces

A **vector space** $V$ over a field $\mathbb{F}$ (usually $\mathbb{R}$ or $\mathbb{C}$) satisfies:

**Vector Addition**: Commutative, associative, identity, inverse

**Scalar Multiplication**: Distributive, associative, identity

**Key Concepts**:

| Concept | Definition |
|---------|-----------|
| **Subspace** | Non-empty subset closed under addition & scalar multiplication |
| **Linear Independence** | Vectors $\mathbf{v}_1, \ldots, \mathbf{v}_n$ independent if $c_1\mathbf{v}_1 + \cdots + c_n\mathbf{v}_n = \mathbf{0}$ only when all $c_i = 0$ |
| **Basis** | Linearly independent spanning set |
| **Dimension** | Number of vectors in a basis: $\dim(V)$ |
| **Span** | All linear combinations of given vectors |

### 🔄 Linear Transformations

A **linear transformation** (or linear map) $T: V \to W$ satisfies:

$$T(c\mathbf{u} + d\mathbf{v}) = cT(\mathbf{u}) + dT(\mathbf{v})$$

**Key Properties**:

| Property | Formula |
|----------|---------|
| **Kernel** | $\ker(T) = \{\mathbf{v} \in V : T(\mathbf{v}) = \mathbf{0}\}$ |
| **Image/Range** | $\text{Im}(T) = \{T(\mathbf{v}) : \mathbf{v} \in V\}$ |
| **Rank-Nullity** | $\text{rank}(T) + \text{nullity}(T) = \dim(V)$ |
| **Matrix Representation** | $T(\mathbf{x}) = A\mathbf{x}$ for some matrix $A$ |

**Examples**:
- Rotation in $\mathbb{R}^2$ by angle $\theta$
- Projection onto a subspace
- Differentiation operator $D(f) = f'$

### 🔀 Symmetry Groups

A **symmetry group** captures all symmetries of a geometric object.

**Dihedral Group** $D_n$ (Symmetries of regular $n$-gon):

$$|D_n| = 2n \quad \text{(}n \text{ rotations, } n \text{ reflections)}$$

**Permutation Group** $S_n$ (All permutations of $n$ elements):

$$|S_n| = n! \quad \text{(identity, transpositions, cycles)}$$

**Cycle Notation**: $(1\ 2\ 3) = 1 \to 2 \to 3 \to 1$

**Composition**: $(1\ 2)(2\ 3) = (1\ 3\ 2)$ (apply right to left)

### ⚖️ Bilinear Forms

A **bilinear form** on a vector space $V$ is a function $B: V \times V \to \mathbb{F}$ that is linear in each argument:

$$B(c\mathbf{u} + d\mathbf{v}, \mathbf{w}) = cB(\mathbf{u}, \mathbf{w}) + dB(\mathbf{v}, \mathbf{w})$$

**Inner Product** (Special bilinear form):

$$\langle \mathbf{u}, \mathbf{v} \rangle = u_1 v_1 + u_2 v_2 + \cdots + u_n v_n$$

**Properties**:
- **Symmetric**: $\langle \mathbf{u}, \mathbf{v} \rangle = \langle \mathbf{v}, \mathbf{u} \rangle$
- **Positive Definite**: $\langle \mathbf{v}, \mathbf{v} \rangle > 0$ for $\mathbf{v} \neq \mathbf{0}$
- **Norm**: $\|\mathbf{v}\| = \sqrt{\langle \mathbf{v}, \mathbf{v} \rangle}$

**Orthogonality**: $\mathbf{u} \perp \mathbf{v}$ if $\langle \mathbf{u}, \mathbf{v} \rangle = 0$

### 🎭 Linear Groups

**General Linear Group** $GL_n(\mathbb{F})$:

$$GL_n(\mathbb{F}) = \{A \in M_n(\mathbb{F}) : \det(A) \neq 0\}$$

$$|GL_n(\mathbb{F})| = (q^n - 1)(q^n - q) \cdots (q^n - q^{n-1}) \text{ (for finite field with } q \text{ elements)}$$

**Special Linear Group** $SL_n(\mathbb{F})$:

$$SL_n(\mathbb{F}) = \{A \in GL_n(\mathbb{F}) : \det(A) = 1\}$$

**Orthogonal Group** $O(n)$:

$$O(n) = \{A \in GL_n(\mathbb{R}) : AA^T = I\}$$

**Special Orthogonal Group** $SO(n)$:

$$SO(n) = \{A \in O(n) : \det(A) = 1\} \quad \text{(rotations)}$$

---

## 🎲 Discrete Mathematics

### 🧠 Logic and Set Theory

#### De Morgan's Laws

$$\boxed{\neg(p \land q) \equiv \neg p \lor \neg q} \quad \boxed{\neg(p \lor q) \equiv \neg p \land \neg q}$$

#### Conditional & Biconditional

$$p \rightarrow q \equiv \neg p \lor q \quad p \leftrightarrow q \equiv (p \rightarrow q) \land (q \rightarrow p)$$

#### Set Operations

$$\boxed{|A \cup B| = |A| + |B| - |A \cap B|} \quad \text{(Inclusion-Exclusion)}$$

$$\text{Power Set Size} = 2^n \quad \text{(for set with } n \text{ elements)}$$

---

### 🔢 Combinatorics (Counting)

| Concept | Formula | When to Use | Example |
|---------|---------|------------|---------|
| **Factorial** | $n! = n(n-1) \cdots 1$ | Arrangements | $5! = 120$ |
| **Permutations** | $P(n,r) = \frac{n!}{(n-r)!}$ | **Order matters** | Races, rankings |
| **Combinations** | $C(n,r) = \frac{n!}{r!(n-r)!}$ | **Order doesn't matter** | Committees, hands |
| **Repeats** | $\frac{n!}{n_1! n_2! \cdots n_k!}$ | Identical objects | "MISSISSIPPI" |

---

### 📊 Number Theory & Sequences

#### Arithmetic Sequences (Constant Difference $d$)

$$a_n = a_1 + (n-1)d \quad S_n = \frac{n}{2}(a_1 + a_n)$$

#### Geometric Sequences (Constant Ratio $r$)

$$a_n = a_1 \cdot r^{n-1} \quad S_n = a_1 \frac{1 - r^n}{1 - r} \quad S_\infty = \frac{a_1}{1 - r} \text{ (for } |r| < 1)$$

#### Modular Arithmetic

$$a \equiv b \pmod{m} \text{ means } m \text{ divides } (a-b)$$

$$a = bq + r \text{ where } 0 \leq r < |b| \quad \text{(Division Algorithm)}$$

---

### 🕸️ Graph Theory

$$\boxed{\sum_{v \in V} \deg(v) = 2|E|} \quad \text{(Handshaking Lemma)}$$

$$\boxed{V - E + F = 2} \quad \text{(Euler's Formula for Planar Graphs)}$$

---

### 🎰 Probability

| Concept | Formula | Notes |
|---------|---------|-------|
| **Probability** | $P(E) = \frac{\text{favorable}}{\text{total}}$ | $0 \leq P(E) \leq 1$ |
| **Complement** | $P(\overline{E}) = 1 - P(E)$ | "NOT E" |
| **Addition** | $P(A \cup B) = P(A) + P(B) - P(A \cap B)$ | OR rule |
| **Multiplication** | $P(A \cap B) = P(A) \times P(B\|A)$ | AND rule |
| **Expected Value** | $E(X) = \sum x_i P(x_i)$ | Long-run average |

### 🔢 Boolean Algebra

A **Boolean algebra** is a set with two operations (AND $\land$, OR $\lor$) and complement ($\neg$).

**Boolean Laws**:

| Law | Formula |
|-----|---------|
| **Identity** | $p \lor 0 = p$ and $p \land 1 = p$ |
| **Null/Domination** | $p \lor 1 = 1$ and $p \land 0 = 0$ |
| **Idempotent** | $p \lor p = p$ and $p \land p = p$ |
| **Double Negation** | $\neg(\neg p) = p$ |
| **Commutative** | $p \lor q = q \lor p$ and $p \land q = q \land p$ |
| **Associative** | $(p \lor q) \lor r = p \lor (q \lor r)$ |
| **Distributive** | $p \lor (q \land r) = (p \lor q) \land (p \lor r)$ |
| **De Morgan** | $\neg(p \lor q) = \neg p \land \neg q$ |

**Truth Table Application**:

| $p$ | $q$ | $p \land q$ | $p \lor q$ | $\neg p$ |
|:---:|:---:|:----------:|:--------:|:-------:|
| 0 | 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 | 0 |

### 🔁 Recurrence Relations

A **recurrence relation** expresses a sequence term in terms of previous terms.

**General Solution Steps**:
1. Find the characteristic equation
2. Solve for characteristic roots
3. Construct general solution

**Common Types**:

| Type | Form | General Solution |
|------|------|------------------|
| **Linear Homogeneous** | $a_n = c_1 a_{n-1} + c_2 a_{n-2}$ | $a_n = A r_1^n + B r_2^n$ (where $r_i$ are roots) |
| **Fibonacci** | $F_n = F_{n-1} + F_{n-2}$ | $F_n = A\phi^n + B\psi^n$ (where $\phi = \frac{1+\sqrt{5}}{2}$) |
| **Linear Non-Homogeneous** | $a_n = c_1 a_{n-1} + f(n)$ | General + Particular solution |

**Example**: $a_n = 3a_{n-1} - 2a_{n-2}$
- Characteristic: $r^2 - 3r + 2 = 0 \Rightarrow r = 1, 2$
- General solution: $a_n = A \cdot 1^n + B \cdot 2^n = A + B \cdot 2^n$

---

## 💡 Pro Tips & Mnemonics

### Trigonometry
- **SOHCAHTOA**: Memory aid for sin, cos, tan ratios
- **ASTC**: "All Students Take Calculus" for quadrant signs

### Algebra
- **Factor First**: Always check for common factors before other methods
- **FOIL**: First, Outer, Inner, Last (for binomial multiplication)

### Discrete Math
- **Ask "Does order matter?"** → Permutation (yes) vs Combination (no)
- **Identify the problem type** → Solve strategically, not by memorizing
- **Draw a tree diagram** → Helps visualize counting problems
- **Always find sample space first** → Before calculating probability

---

**Last Updated**: 2024 | For Educational Purposes
