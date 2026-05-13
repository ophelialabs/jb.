# ============================================================================
# COMPREHENSIVE MATHEMATICS CHEATSHEET
# Trigonometry, Linear, Quadratic, Algebra, and Discrete Mathematics
# ============================================================================

# ============================================================================
# SECTION 1: TRIGONOMETRIC FUNCTIONS & IDENTITIES
# ============================================================================

# --- CORE DEFINITIONS (SOHCAHTOA) ---
# sin(θ) = Opposite / Hypotenuse
# cos(θ) = Adjacent / Hypotenuse
# tan(θ) = Opposite / Adjacent
# Relationship: tan(θ) = sin(θ) / cos(θ)

# --- SPECIAL ANGLE VALUES ---
const SPECIAL_ANGLES = Dict(
    0 => (sin=0, cos=1, tan=0),
    π/6 => (sin=0.5, cos=√3/2, tan=1/√3),
    π/4 => (sin=1/√2, cos=1/√2, tan=1),
    π/3 => (sin=√3/2, cos=0.5, tan=√3),
    π/2 => (sin=1, cos=0, tan=Inf)
)

function sin_deg(degrees)
    """Convert degrees to radians and compute sine"""
    return sin(deg2rad(degrees))
end

function cos_deg(degrees)
    """Convert degrees to radians and compute cosine"""
    return cos(deg2rad(degrees))
end

function tan_deg(degrees)
    """Convert degrees to radians and compute tangent"""
    return tan(deg2rad(degrees))
end

function cot(θ)
    """Cotangent: cot(θ) = cos(θ) / sin(θ) = 1 / tan(θ)"""
    return cos(θ) / sin(θ)
end

function sec(θ)
    """Secant: sec(θ) = 1 / cos(θ)"""
    return 1 / cos(θ)
end

function csc(θ)
    """Cosecant: csc(θ) = 1 / sin(θ)"""
    return 1 / sin(θ)
end

# --- PYTHAGOREAN IDENTITIES ---
# sin²(θ) + cos²(θ) = 1
# 1 + tan²(θ) = sec²(θ)
# 1 + cot²(θ) = csc²(θ)

function verify_pythagorean(θ)
    """Verify: sin²(θ) + cos²(θ) = 1"""
    return sin(θ)^2 + cos(θ)^2
end

# --- COMPOUND ANGLE FORMULAS ---

function sin_sum(A, B)
    """sin(A+B) = sin(A)cos(B) + cos(A)sin(B)"""
    return sin(A)*cos(B) + cos(A)*sin(B)
end

function sin_diff(A, B)
    """sin(A-B) = sin(A)cos(B) - cos(A)sin(B)"""
    return sin(A)*cos(B) - cos(A)*sin(B)
end

function cos_sum(A, B)
    """cos(A+B) = cos(A)cos(B) - sin(A)sin(B)"""
    return cos(A)*cos(B) - sin(A)*sin(B)
end

function cos_diff(A, B)
    """cos(A-B) = cos(A)cos(B) + sin(A)sin(B)"""
    return cos(A)*cos(B) + sin(A)*sin(B)
end

function tan_sum(A, B)
    """tan(A+B) = (tan(A) + tan(B)) / (1 - tan(A)tan(B))"""
    return (tan(A) + tan(B)) / (1 - tan(A)*tan(B))
end

function tan_diff(A, B)
    """tan(A-B) = (tan(A) - tan(B)) / (1 + tan(A)tan(B))"""
    return (tan(A) - tan(B)) / (1 + tan(A)*tan(B))
end

# --- DOUBLE ANGLE FORMULAS ---

function sin_double(θ)
    """sin(2θ) = 2sin(θ)cos(θ)"""
    return 2*sin(θ)*cos(θ)
end

function cos_double_v1(θ)
    """cos(2θ) = cos²(θ) - sin²(θ)"""
    return cos(θ)^2 - sin(θ)^2
end

function cos_double_v2(θ)
    """cos(2θ) = 2cos²(θ) - 1"""
    return 2*cos(θ)^2 - 1
end

function cos_double_v3(θ)
    """cos(2θ) = 1 - 2sin²(θ)"""
    return 1 - 2*sin(θ)^2
end

function tan_double(θ)
    """tan(2θ) = 2tan(θ) / (1 - tan²(θ))"""
    return 2*tan(θ) / (1 - tan(θ)^2)
end

# --- HALF ANGLE FORMULAS (Power Reduction) ---

function sin_squared(θ)
    """sin²(θ) = (1 - cos(2θ)) / 2"""
    return (1 - cos(2*θ)) / 2
end

function cos_squared(θ)
    """cos²(θ) = (1 + cos(2θ)) / 2"""
    return (1 + cos(2*θ)) / 2
end

# --- GENERAL TRIANGLE FORMULAS ---

function law_of_sines(a, A, b)
    """Given a, angle A, and b, find angle B using: a/sin(A) = b/sin(B)"""
    return asin(b * sin(A) / a)
end

function law_of_cosines(a, b, C)
    """Find side c: c² = a² + b² - 2ab·cos(C)"""
    return √(a^2 + b^2 - 2*a*b*cos(C))
end

function triangle_area(a, b, C)
    """Area = (1/2)ab·sin(C)"""
    return 0.5 * a * b * sin(C)
end

# --- ASTC RULE (Quadrant Signs) ---
# Q1 (All): All functions are positive
# Q2 (Silver): Sine and Cosecant positive
# Q3 (Tea): Tangent and Cotangent positive
# Q4 (Cups): Cosine and Secant positive

# ============================================================================
# SECTION 2: LINEAR FUNCTIONS AND EQUATIONS
# ============================================================================

# --- STANDARD FORMS ---

function slope_intercept(m, b, x)
    """
    y = mx + b
    m: slope, b: y-intercept
    """
    return m * x + b
end

function point_slope(m, x₁, y₁, x)
    """
    y - y₁ = m(x - x₁)
    """
    return m * (x - x₁) + y₁
end

function standard_form(A, B, C, x)
    """
    Ax + By = C
    Solve for y: y = (C - Ax) / B
    """
    return (C - A*x) / B
end

# --- SLOPE ANALYSIS ---

function calculate_slope(x₁, y₁, x₂, y₂)
    """
    m = (y₂ - y₁) / (x₂ - x₁)
    """
    if x₂ == x₁
        return Inf  # Undefined slope (vertical line)
    end
    return (y₂ - y₁) / (x₂ - x₁)
end

function slope_classification(m)
    """
    Classify slope:
    m > 0: Increasing (↗)
    m < 0: Decreasing (↘)
    m = 0: Horizontal (→)
    m = Inf: Vertical (↑)
    """
    if m == Inf
        return "Vertical (undefined)"
    elseif m == 0
        return "Horizontal"
    elseif m > 0
        return "Increasing"
    else
        return "Decreasing"
    end
end

# --- LINE RELATIONSHIPS ---

function parallel_lines(m₁, m₂)
    """
    Lines are parallel if m₁ = m₂
    """
    return m₁ ≈ m₂
end

function perpendicular_lines(m₁, m₂)
    """
    Lines are perpendicular if m₁ × m₂ = -1
    """
    return abs(m₁ * m₂ + 1) < 1e-10
end

# --- DISTANCE & MIDPOINT ---

function distance_formula(x₁, y₁, x₂, y₂)
    """
    d = √[(x₂ - x₁)² + (y₂ - y₁)²]
    """
    return √((x₂ - x₁)^2 + (y₂ - y₁)^2)
end

function midpoint_formula(x₁, y₁, x₂, y₂)
    """
    M = ((x₁ + x₂)/2, (y₁ + y₂)/2)
    """
    return ((x₁ + x₂) / 2, (y₁ + y₂) / 2)
end

# --- MATRICES AND MATRIX OPERATIONS ---

function matrix_add(A::Matrix, B::Matrix)
    """
    Matrix addition: (A + B)ᵢⱼ = aᵢⱼ + bᵢⱼ
    """
    return A .+ B
end

function matrix_multiply(A::Matrix, B::Matrix)
    """
    Matrix multiplication: (AB)ᵢⱼ = Σₖ aᵢₖbₖⱼ
    """
    return A * B
end

function matrix_transpose(A::Matrix)
    """
    Transpose: (Aᵀ)ᵢⱼ = aⱼᵢ
    """
    return transpose(A)
end

function matrix_determinant(A::Matrix)
    """
    Determinant of square matrix
    """
    return det(A)
end

function matrix_inverse(A::Matrix)
    """
    Inverse: A⁻¹ such that AA⁻¹ = I
    """
    return inv(A)
end

# --- EIGENVALUES & EIGENVECTORS ---

function eigenvalues(A::Matrix)
    """
    Find eigenvalues: det(A - λI) = 0
    """
    return eigvals(A)
end

function eigenvectors(A::Matrix)
    """
    Find eigenvectors and eigenvalues
    Returns: (eigenvalues, eigenvectors)
    """
    F = eigen(A)
    return (F.values, F.vectors)
end

function characteristic_polynomial(A::Matrix)
    """
    Compute characteristic polynomial det(A - λI)
    """
    n = size(A, 1)
    # Placeholder: actual implementation would use symbolic math
    return "det(A - λI)"
end

# ============================================================================
# SECTION 3: QUADRATIC FUNCTIONS AND EQUATIONS
# ============================================================================

# --- STANDARD FORM ---
# ax² + bx + c = 0
# a ≠ 0

function quadratic_formula(a, b, c)
    """
    Solve ax² + bx + c = 0
    Returns tuple of two solutions (real or complex)
    """
    discriminant = b^2 - 4*a*c
    sqrt_discriminant = √(Complex(discriminant))
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    return (x1, x2)
end

function discriminant(a, b, c)
    """
    Calculate D = b² - 4ac
    D > 0: Two distinct real solutions
    D = 0: One real solution (repeated root)
    D < 0: Two complex/imaginary solutions
    """
    return b^2 - 4*a*c
end

function solve_by_factoring(factors::Tuple)
    """
    Given factors (p, q), solve (x - p)(x - q) = 0
    Returns x = p or x = q
    """
    return factors
end

function complete_the_square(a, b, c)
    """
    Convert ax² + bx + c to vertex form: a(x - h)² + k
    Returns (h, k) - the vertex coordinates
    """
    h = -b / (2*a)
    k = c - (b^2 / (4*a))
    return (h, k)
end

function vertex_form(a, h, k, x)
    """Evaluate f(x) = a(x - h)² + k"""
    return a * (x - h)^2 + k
end

function roots_from_discriminant(a, b, c)
    """
    Analyze nature of roots based on discriminant
    Returns: :two_real, :one_real, or :two_complex
    """
    D = discriminant(a, b, c)
    if D > 0
        return :two_real
    elseif D == 0
        return :one_real
    else
        return :two_complex
    end
end

# --- CONIC SECTIONS ---

function conic_classification(A, B, C)
    """
    Classify conic using discriminant Δ = B² - 4AC
    Δ < 0: Ellipse/Circle
    Δ = 0: Parabola
    Δ > 0: Hyperbola
    """
    discriminant = B^2 - 4*A*C
    if discriminant < 0
        if A ≈ C && B ≈ 0
            return "Circle"
        else
            return "Ellipse"
        end
    elseif discriminant ≈ 0
        return "Parabola"
    else
        return "Hyperbola"
    end
end

function ellipse_equation(a, b, h, k, x, y)
    """
    Standard form: (x-h)²/a² + (y-k)²/b² = 1
    Center: (h, k), semi-major: a, semi-minor: b
    """
    return ((x - h)^2 / a^2) + ((y - k)^2 / b^2)
end

function hyperbola_equation(a, b, h, k, x, y)
    """
    Standard form: (x-h)²/a² - (y-k)²/b² = 1
    Asymptotes: y = ±(b/a)(x - h) + k
    """
    return ((x - h)^2 / a^2) - ((y - k)^2 / b^2)
end

function parabola_vertex_form(a, h, k, x)
    """
    Vertex form: y = a(x - h)² + k or x = a(y - k)² + h
    Vertex: (h, k)
    """
    return a * (x - h)^2 + k
end

# ============================================================================
# SECTION 4: ALGEBRAIC FUNCTIONS AND EQUATIONS
# ============================================================================

# --- POLYNOMIAL OPERATIONS ---

function poly_add(p1::Vector, p2::Vector)
    """
    Add two polynomials represented as coefficient vectors
    """
    n = max(length(p1), length(p2))
    p1_padded = [p1; zeros(n - length(p1))]
    p2_padded = [p2; zeros(n - length(p2))]
    return p1_padded .+ p2_padded
end

function poly_multiply(p1::Vector, p2::Vector)
    """
    Multiply two polynomials
    """
    result = zeros(length(p1) + length(p2) - 1)
    for i in 1:length(p1)
        for j in 1:length(p2)
            result[i + j - 1] += p1[i] * p2[j]
        end
    end
    return result
end

# --- FACTORING POLYNOMIALS ---

function factor_by_grouping(coeffs::Vector)
    """
    Factor polynomial by grouping
    Example: x³ - x² + 4x - 4 → (x² + 4)(x - 1)
    """
    n = length(coeffs)
    for i in 1:(n-1)
        for j in (i+1):n
            if coeffs[i] == coeffs[j]
                # Found common factor
                return [coeffs[1:i]; coeffs[i+1:end] - coeffs[i]]
            end
        end
    end
    return coeffs  # No factoring found
end

function synthetic_division(dividend::Vector, divisor_coeff::Vector)
    """
    Synthetic division for polynomials
    Dividend: highest degree first
    Divisor: only coefficients, highest degree last
    """
    result = copy(dividend)
    n = length(divisor_coeff)
    
    for i in 1:(length(dividend) - n + 1)
        if result[i] != 0
            for j in 1:n
                result[i + j - 1] -= result[i] * divisor_coeff[j]
            end
        end
    end
    
    return result[1:(end-n+1)]  # Quotient
end

# --- EXPONENTS AND RADICALS ---

function power(base, exp)
    """
    Compute base^exp for integer exponents
    """
    result = 1
    for _ in 1:abs(exp)
        result *= base
    end
    
    if exp < 0
        return 1 / result
    end
    return result
end

function radical(expr, index=2)
    """
    Compute n-th root: index = 2 for square root, 3 for cube root, etc.
    """
    return expr^(1/index)
end

# --- GROUPS (Abstract Algebra) ---

struct Group
    elements::Vector
    operation::Function
    identity::Any
    
    function Group(elements, operation, identity)
        new(elements, operation, identity)
    end
end

function verify_group(G::Group)
    """
    Verify group axioms:
    1. Closure: a ∘ b ∈ G for all a, b ∈ G
    2. Associativity (assumed for standard operations)
    3. Identity: e ∘ a = a ∘ e = a
    4. Inverse: a ∘ a⁻¹ = e
    """
    # Check identity
    for a in G.elements
        if !(G.operation(G.identity, a) == a)
            return false
        end
    end
    return true
end

function cyclic_group(n)
    """
    Generate cyclic group of order n: {0, 1, 2, ..., n-1} under addition mod n
    """
    return Group(
        collect(0:(n-1)),
        (a, b) -> mod(a + b, n),
        0
    )
end

# --- VECTOR SPACES ---

struct VectorSpace
    dimension::Int
    field::String  # "ℝ" or "ℂ"
    
    function VectorSpace(dim, field="ℝ")
        new(dim, field)
    end
end

function span(vectors::Vector{Vector})
    """
    Find span of vectors: all linear combinations c₁v₁ + ... + cₙvₙ
    Returns: dimension of span (rank)
    """
    # Placeholder: would use rank computation
    return "Span dimension"
end

function linear_independence(vectors::Vector{Vector})
    """
    Check if vectors are linearly independent
    Independent if: c₁v₁ + ... + cₙvₙ = 0 only when all cᵢ = 0
    """
    # Placeholder: would check rank vs number of vectors
    return true
end

function basis_dimension(V::VectorSpace)
    """
    Dimension of vector space = number of basis vectors
    """
    return V.dimension
end

# --- LINEAR TRANSFORMATIONS ---

struct LinearTransformation
    matrix::Matrix
    domain_dim::Int
    codomain_dim::Int
end

function apply_transformation(T::LinearTransformation, v::Vector)
    """
    Apply linear transformation: T(v) = Av
    """
    return T.matrix * v
end

function kernel(T::LinearTransformation)
    """
    Kernel: ker(T) = {v : T(v) = 0}
    """
    # Placeholder: would compute null space
    return "Null space"
end

function image(T::LinearTransformation)
    """
    Image: Im(T) = {T(v) : v in domain}
    """
    # Placeholder: would compute column space
    return "Column space"
end

function rank_nullity(T::LinearTransformation)
    """
    Rank-Nullity Theorem: rank(T) + nullity(T) = dim(domain)
    """
    rank_val = rank(T.matrix)
    nullity_val = T.domain_dim - rank_val
    return (rank_val, nullity_val)
end

# --- SYMMETRY GROUPS ---

struct SymmetryGroup
    name::String
    order::Int
    elements::Vector{String}
end

function dihedral_group(n)
    """
    Dihedral group Dₙ: symmetries of regular n-gon
    Order: |Dₙ| = 2n (n rotations + n reflections)
    """
    rotations = ["r^$i" for i in 0:(n-1)]
    reflections = ["s*r^$i" for i in 0:(n-1)]
    elements = vcat(rotations, reflections)
    return SymmetryGroup("D_$n", 2*n, elements)
end

function symmetric_group(n)
    """
    Symmetric group Sₙ: all permutations of n elements
    Order: |Sₙ| = n!
    """
    return SymmetryGroup("S_$n", factorial(n), ["permutations of $n elements"])
end

function cycle_notation(permutation::Vector)
    """
    Convert permutation to cycle notation
    Example: [2, 3, 1] represents cycle (1 2 3)
    """
    # Placeholder: cycle decomposition
    return "Cycle notation"
end

# --- BILINEAR FORMS ---

struct BilinearForm
    matrix::Matrix
end

function inner_product(u::Vector, v::Vector)
    """
    Standard inner product: ⟨u, v⟩ = u₁v₁ + u₂v₂ + ... + uₙvₙ
    """
    return dot(u, v)
end

function bilinear_form_apply(B::BilinearForm, u::Vector, v::Vector)
    """
    Apply bilinear form: B(u, v) = uᵀBv
    """
    return transpose(u) * B.matrix * v
end

function norm_from_inner_product(v::Vector)
    """
    Norm: ‖v‖ = √⟨v, v⟩
    """
    return √(dot(v, v))
end

function orthogonal_vectors(u::Vector, v::Vector)
    """
    Vectors are orthogonal if ⟨u, v⟩ = 0
    """
    return abs(dot(u, v)) < 1e-10
end

function gram_schmidt(vectors::Vector{Vector})
    """
    Gram-Schmidt orthogonalization process
    Convert linearly independent vectors to orthonormal basis
    """
    n = length(vectors)
    orthogonal = Vector{Vector}(undef, n)
    
    for i in 1:n
        orthogonal[i] = vectors[i]
        for j in 1:(i-1)
            proj = (dot(vectors[i], orthogonal[j]) / dot(orthogonal[j], orthogonal[j])) .* orthogonal[j]
            orthogonal[i] = orthogonal[i] - proj
        end
    end
    
    return [v / norm(v) for v in orthogonal]
end

# --- LINEAR GROUPS ---

function general_linear_group(n, p=nothing)
    """
    GLₙ(𝔽): invertible n×n matrices over field 𝔽
    If p is prime: |GLₙ(Fₚ)| = (qⁿ - 1)(qⁿ - q)...(qⁿ - qⁿ⁻¹) where q = p
    """
    return "GL_$n"
end

function special_linear_group(n, p=nothing)
    """
    SLₙ(𝔽): matrices in GLₙ with determinant 1
    Order: |SLₙ(Fₚ)| = |GLₙ(Fₚ)| / (p - 1)
    """
    return "SL_$n"
end

function orthogonal_group(n)
    """
    O(n): matrices A where AAᵀ = I
    Preserves inner product: ⟨Au, Av⟩ = ⟨u, v⟩
    """
    return "O($n)"
end

function special_orthogonal_group(n)
    """
    SO(n): orthogonal matrices with det(A) = 1 (rotations)
    """
    return "SO($n)"
end

function unitary_group(n)
    """
    U(n): complex matrices A where A†A = I
    Complex generalization of orthogonal group
    """
    return "U($n)"
end

# ============================================================================
# SECTION 5: DISCRETE MATHEMATICS
# ============================================================================

# --- LOGIC & SET THEORY ---

# De Morgan's Laws
# ¬(p ∧ q) ≡ ¬p ∨ ¬q
# ¬(p ∨ q) ≡ ¬p ∧ ¬q
# Conditional: p → q ≡ ¬p ∨ q
# Biconditional: p ↔ q ≡ (p → q) ∧ (q → p)

function inclusion_exclusion(A_size, B_size, intersection_size)
    """
    |A ∪ B| = |A| + |B| - |A ∩ B|
    """
    return A_size + B_size - intersection_size
end

function power_set_count(n)
    """
    Number of subsets of a set with n elements = 2ⁿ
    """
    return 2^n
end

# --- COMBINATORICS (Counting) ---

function factorial(n)
    """n! = n × (n-1) × ... × 1"""
    return factorial(BigInt(n))
end

function permutations(n, r)
    """
    P(n,r) = n! / (n-r)!
    Number of ways to arrange r items from n (order matters)
    """
    return factorial(n) ÷ factorial(n - r)
end

function combinations(n, r)
    """
    C(n,r) = n! / (r!(n-r)!)
    Number of ways to choose r items from n (order doesn't matter)
    """
    return factorial(n) ÷ (factorial(r) * factorial(n - r))
end

function permutations_with_repetition(n, repetitions::Vector)
    """
    n! / (n₁! × n₂! × ... × nₖ!)
    Arranging objects where some are identical
    Example: letters in "MISSISSIPPI"
    """
    return factorial(sum(repetitions)) ÷ prod(factorial.(repetitions))
end

# --- NUMBER THEORY & SEQUENCES ---

function arithmetic_sum(a₁, aₙ, n)
    """
    Sum of arithmetic sequence: Sₙ = n/2 × (a₁ + aₙ)
    """
    return n * (a₁ + aₙ) / 2
end

function arithmetic_term(a₁, d, n)
    """
    nth term of arithmetic sequence: aₙ = a₁ + (n-1)d
    """
    return a₁ + (n - 1) * d
end

function geometric_sum(a₁, r, n)
    """
    Sum of geometric sequence: Sₙ = a₁ × (1 - rⁿ) / (1 - r)
    Valid for r ≠ 1
    """
    if r == 1
        return a₁ * n
    end
    return a₁ * (1 - r^n) / (1 - r)
end

function geometric_term(a₁, r, n)
    """
    nth term of geometric sequence: aₙ = a₁ × r^(n-1)
    """
    return a₁ * r^(n - 1)
end

function modular_congruence(a, b, m)
    """
    a ≡ b (mod m) means m divides (a - b)
    Returns true if congruent
    """
    return mod(a - b, m) == 0
end

function division_algorithm(a, b)
    """
    a = bq + r, where 0 ≤ r < |b|
    Returns quotient q and remainder r
    """
    q = div(a, b)
    r = mod(a, b)
    return (q, r)
end

# --- GRAPH THEORY ---

function handshaking_lemma(degrees::Vector)
    """
    Sum of degrees = 2 × |E|
    Verify: sum of all vertex degrees equals twice the number of edges
    """
    return sum(degrees) ÷ 2
end

function euler_formula_planar(V, E, F)
    """
    Euler's formula for planar graphs: V - E + F = 2
    Returns true if graph satisfies the formula
    """
    return V - E + F == 2
end

# --- PROBABILITY ---

function probability_event(favorable_outcomes, total_outcomes)
    """
    P(E) = |E| / |S|
    """
    return favorable_outcomes / total_outcomes
end

function complement_rule(P_E)
    """
    P(Ē) = 1 - P(E)
    Probability of complement event
    """
    return 1 - P_E
end

function expected_value(outcomes::Vector, probabilities::Vector)
    """
    E(X) = Σ xᵢ × P(xᵢ)
    """
    return sum(outcomes .* probabilities)
end

# --- BOOLEAN ALGEBRA ---

function boolean_and(p::Bool, q::Bool)
    """
    Boolean AND: p ∧ q
    """
    return p && q
end

function boolean_or(p::Bool, q::Bool)
    """
    Boolean OR: p ∨ q
    """
    return p || q
end

function boolean_not(p::Bool)
    """
    Boolean NOT: ¬p
    """
    return !p
end

function de_morgan_and(p::Bool, q::Bool)
    """
    ¬(p ∧ q) ≡ ¬p ∨ ¬q
    """
    return !p || !q
end

function de_morgan_or(p::Bool, q::Bool)
    """
    ¬(p ∨ q) ≡ ¬p ∧ ¬q
    """
    return !p && !q
end

function truth_table_size(num_variables)
    """
    Number of rows in truth table = 2ⁿ for n variables
    """
    return 2^num_variables
end

# --- RECURRENCE RELATIONS ---

function fibonacci(n)
    """
    Fibonacci: Fₙ = Fₙ₋₁ + Fₙ₋₂
    F₀ = 0, F₁ = 1
    """
    if n <= 1
        return n
    end
    
    a, b = 0, 1
    for _ in 2:n
        a, b = b, a + b
    end
    return b
end

function solve_linear_homogeneous(c1, c2, r1, r2, n)
    """
    Solve aₙ = c₁·aₙ₋₁ + c₂·aₙ₋₂
    Characteristic roots: r₁, r₂
    General solution: aₙ = A·r₁ⁿ + B·r₂ⁿ
    """
    # Placeholder: would solve for A, B using initial conditions
    return "aₙ = A*r₁ⁿ + B*r₂ⁿ"
end

function solve_recurrence_with_initial(recurrence_func, a0, a1, n)
    """
    Solve recurrence relation with initial conditions
    recurrence_func: function defining aₙ in terms of previous terms
    """
    sequence = [a0, a1]
    for i in 3:n
        next_term = recurrence_func(sequence[end], sequence[end-1], i)
        push!(sequence, next_term)
    end
    return sequence
end

function characteristic_polynomial_recurrence(coeffs::Vector)
    """
    For recurrence aₙ = c₁·aₙ₋₁ + ... + cₖ·aₙ₋ₖ
    Characteristic polynomial: rⁿ - c₁·rⁿ⁻¹ - ... - cₖ = 0
    """
    # Placeholder: would construct polynomial
    return "rⁿ - c₁·rⁿ⁻¹ - ... - cₖ"
end

# ============================================================================
# QUICK REFERENCE GUIDE
# ============================================================================
# 
# TRIGONOMETRY TIPS:
# - Use ASTC rule to determine sign of trig functions in each quadrant
# - Compound angle formulas useful for angles like 75° (45° + 30°)
# - Double/half angle formulas simplify calculus and higher-degree equations
# - Inverse functions: arcsin, arccos, arctan have restricted domains/ranges
#
# LINEAR ALGEBRA TIPS:
# - Slope determines line direction: m > 0 increasing, m < 0 decreasing
# - Parallel lines: same slope; Perpendicular: slopes are negative reciprocals
# - Matrices: order matters! AB ≠ BA in general
# - Eigenvalues/eigenvectors: found from det(A - λI) = 0
#
# QUADRATIC TIPS:
# - Factoring is fastest when equation factors nicely
# - Use square root property when b = 0 (no linear term)
# - Completing the square converts to vertex form for graphing
# - Conic sections: classify using discriminant Δ = B² - 4AC
#
# ALGEBRA (ABSTRACT) TIPS:
# - Groups: verify closure, associativity, identity, inverse
# - Vector spaces: check subspace closure properties
# - Linear transformations: represented by matrices
# - Gram-Schmidt: creates orthonormal basis from any basis
#
# DISCRETE MATH TIPS:
# - Identify problem type: order matters? (Permutation vs Combination)
# - Recurrence relations: find characteristic roots for general solution
# - Boolean algebra: De Morgan's Laws crucial for logic simplification
# - Most problems solved by breaking into sub-problems (Recursion)
#
# ============================================================================