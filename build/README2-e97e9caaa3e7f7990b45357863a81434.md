---
marp: true
theme: default
style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
  .footer-box {
    margin-top: 20px;
    padding: 15px;
    border: 3px solid #ffa500;
    border-radius: 10px;
    background-color: #fff9f0;
  }
---

# Hybrid Approaches to N-Body Simulations
### Balancing Classical "Bulk" with Quantum Potential

<div class="columns">
<div>

### 🏛️ The Classical "Workhorse"
**Role & Scope:**
* Manages the vast bulk of particle data. 🌌
* Dominates due to the classical nature of N-body problems.

**Force Calculations:**
* Handles long-range forces (Gravity, Electrostatics).
* **Complexity:** Uses tree-methods like **Barnes-Hut** or **FMM**.

**Time Integration:**
* **Runge-Kutta** (precision)
* **Leapfrog** (energy conservation)

</div>
<div>

### ⚛️ The Quantum "Specialist"
**Role & Target Areas:**
* Targeted for specific sub-problems.
* Focuses on **short-range** complex interactions. 🔬

**Quantum Advantage:**
* Aiming for asymptotic speedups on classical bottlenecks.

**Key Research:**
* **Neighbor Finding:** Quantum algorithms to locate "close neighbors" faster than classical methods. 🔍

</div>
</div>

<div class="footer-box">

**⚠️ Status Check: Active Research**
While classical methods handle the heavy lifting, quantum computing is being researched to tackle specific bottlenecks in dense simulations. 🧪
</div>