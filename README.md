# Applied Type Theory / Прикладная теория типов

**ВМК МГУ, Осень 2025**

Курс по теории типов с акцентом на практические применения: от λ-исчисления до зависимых типов, HoTT и нейро-символического AI.

## Структура курса

### Лекции

| # | Тема | Файл |
|---|------|------|
| 1 | Введение в λ-исчисление | `lecture-1.tex` |
| 2 | λ-исчисление: редукции и нормализация | `lecture-2.tex` |
| 3 | Просто типизированное λ-исчисление (STLC) | `lecture-3.tex` |
| 4 | Алгебраические типы данных (ADT) | `lecture-4.tex` |
| 5 | Алгебра типов, изоморфизмы | `lecture-5.tex` |
| 6 | System F (λ2) — полиморфизм второго порядка | `lecture-5.tex` |
| 7 | Соответствие Карри–Ховарда | `lecture-7.tex` |
| 8 | Субструктурные и сессионные типы | `lecture-8.tex` |
| 9 | λω, λP — высшие типы и зависимые типы | `lecture-9.tex` |
| 10 | От MLTT к Coq: CIC, Identity types | `lecture-10.tex` |
| 11 | Унивалентность, эквивалентности, HIT | `lecture-11.tex` |
| 12 | Neuro-symbolic AI & Type Theory | `lecture-12.tex` |

### Домашние задания

| # | Тема | Формат | Файл |
|---|------|--------|------|
| 1 | Нетипизированное λ-исчисление | LaTeX/PDF | `assignment-1.tex` |
| 2 | STLC, типизация | LaTeX/PDF | `assignment-2.tex` |
| 3 | ADT, алгебра типов | LaTeX/PDF | `assignment-3.tex` |
| 4 | Coq: базовые доказательства | Coq | `assignment_4.v` |
| 5 | Coq: зависимые типы, Identity types, HoTT | Coq | `assignment_5.v` |

## Система оценивания

- **5 домашних заданий**: 40–50 баллов каждое
- **Экзамен**: до 150 баллов
- Задачи со принимаются до конца семестра

| Баллы | Оценка |
|-------|--------|
| 0–79 | 2 |
| 80–149 | 3 |
| 150–199 | 4 |
| 200+ | 5 |

## Литература

### Основная
- **Pierce** — *Types and Programming Languages* (TAPL)
- **Nederpelt, Geuvers** — *Type Theory and Formal Proof: An Introduction*
- **Software Foundations** — [softwarefoundations.cis.upenn.edu](https://softwarefoundations.cis.upenn.edu)

### λ-исчисление и основы
- **Barendregt** — *The Lambda Calculus: Its Syntax and Semantics*
- **Hindley, Seldin** — *Lambda-Calculus and Combinators: An Introduction*
- **Girard, Lafont, Taylor** — *Proofs and Types*
- **Sørensen, Urzyczyn** — *Lectures on the Curry-Howard Isomorphism*

### Coq и формальная верификация
- **Bertot, Castéran** — *Interactive Theorem Proving and Program Development* (Coq'Art)
- **Chlipala** — *Certified Programming with Dependent Types* (CPDT) — [adam.chlipala.net/cpdt](http://adam.chlipala.net/cpdt/)
- **Mimram** — *Program = Proof* — [program-proof.github.io](https://program-proof.github.io/)

### Зависимые типы и MLTT
- **Martin-Löf** — *Intuitionistic Type Theory* (Bibliopolis, 1984)
- **Nordström, Petersson, Smith** — *Programming in Martin-Löf's Type Theory*
- **The Agda Wiki** — [wiki.portal.chalmers.se/agda](https://wiki.portal.chalmers.se/agda)

### HoTT и унивалентные основания
- **HoTT Book** — *Homotopy Type Theory: Univalent Foundations of Mathematics* — [homotopytypetheory.org/book](https://homotopytypetheory.org/book)
- **Rijke** — *Introduction to Homotopy Type Theory* — [arxiv.org/abs/2212.11082](https://arxiv.org/abs/2212.11082)
- **Escardó** — *Introduction to Univalent Foundations of Mathematics with Agda* — [cs.bham.ac.uk/~mhe/HoTT-UF-in-Agda-Lecture-Notes](https://www.cs.bham.ac.uk/~mhe/HoTT-UF-in-Agda-Lecture-Notes/)

### Субструктурные и линейные типы
- **Wadler** — *Linear Types Can Change the World!* (1990)
- **Walker** — *Substructural Type Systems* (in *Advanced Topics in Types and Programming Languages*)
- **Bernardy et al.** — *Linear Haskell: Practical Linearity in a Higher-Order Polymorphic Language* (POPL 2018)

### Сессионные типы
- **Honda** — *Types for Dyadic Interaction* (1993)
- **Vasconcelos** — *Fundamentals of Session Types* (2012)
- **Gay, Hole** — *Subtyping for Session Types in the Pi Calculus*

### Rust и ownership
- **Jung et al.** — *RustBelt: Securing the Foundations of the Rust Programming Language* (POPL 2018)
- **The Rustonomicon** — [doc.rust-lang.org/nomicon](https://doc.rust-lang.org/nomicon/)
- **Weiss et al.** — *Oxide: The Essence of Rust* (2019)

### Neuro-symbolic AI и LLM (лекция 12)
- **Trinh et al.** — *Solving Olympiad Geometry without Human Demonstrations* (Nature, 2024)
- **Yang et al.** — *LeanDojo: Theorem Proving with Retrieval-Augmented Language Models* (NeurIPS 2023)
- **First et al.** — *Baldur: Whole-Proof Generation and Repair with LLMs* (FSE 2023)
- **Willard, Louf** — *Efficient Guided Generation for Large Language Models* (2023) — Outlines
- **Beurer-Kellner et al.** — *Prompting Is Programming: A Query Language for Large Language Models* (PLDI 2023) — LMQL

### Категорная семантика (продвинутое)
- **Lambek, Scott** — *Introduction to Higher Order Categorical Logic*
- **Awodey** — *Category Theory* (Oxford Logic Guides)
- **Crole** — *Categories for Types*

### Видеокурсы
- Курс Москвитина Д.Н. — *Функциональное программирование* [https://www.youtube.com/watch?v=0h3Ot1C0d2I&list=PLlb7e2G7aSpTDub2LFDVBvvjWj-53Gfuh](YouTube)
- **Oregon Programming Languages Summer School** (OPLSS) — [cs.uoregon.edu/research/summerschool](https://www.cs.uoregon.edu/research/summerschool/)
- **DeepSpec Summer School** — [deepspec.org](https://deepspec.org/)

## Ключевые темы курса

```
λ-исчисление → STLC → System F → λω/λP → MLTT → CIC → HoTT
      ↓           ↓         ↓        ↓       ↓      ↓
   Редукции    Типы    Полиморф.  Завис.  Coq/   Унивал.
   α,β,η      ADT     ∀α.τ      типы    Lean   UA, HIT
```

## Контакты

**Воронов Михаил Сергеевич**  
m.voronov@gse.cs.msu.ru
michail.vms@gmail.com

---

*«Типы — это исполнимые спецификации: что запрещено — не скомпилируется»*

