# Applied Type Theory / Прикладная теория типов

Курс по теории типов с акцентом на практические применения: от λ-исчисления до зависимых типов, HoTT и нейро-символического AI.

## Ключевые темы курса

```
λ-исчисление → STLC → System F → λω/λP → MLTT → CIC → HoTT
     ↓          ↓        ↓         ↓       ↓      ↓      ↓
  Редукции    Типы   Полиморф.  Завис.   Coq  Identity  UA
   α,β,η      ADT      ∀α.τ     типы          types    HIT
```

## Структура курса

### Лекции

| # | Тема | Слайды |
|---|------|--------|
| 1 | Введение в λ-исчисление | [PDF](lectures/lecture-1.pdf) |
| 2 | λ-исчисление: редукции и нормализация | [PDF](lectures/lecture-2.pdf) |
| 3–4 | Просто типизированное λ-исчисление (STLC) | [PDF](lectures/lecture-3,4.pdf) |
| 5 | ADT и алгебра типов | [PDF](lectures/lecture-5.pdf) |
| 6 | System F (λ2) — полиморфизм второго порядка | [PDF](lectures/lecture-6.pdf) |
| 7 | Соответствие Карри–Ховарда | [PDF](lectures/lecture-7.pdf) |
| 8 | Субструктурные и сессионные типы | [PDF](lectures/lecture-8.pdf) |
| 9 | λω, λP — высшие типы и зависимые типы | [PDF](lectures/lecture-9.pdf) |
| 10 | От MLTT к Coq: CIC, Identity types | [PDF](lectures/lecture-10.pdf) |
| 11 | Унивалентность, эквивалентности, HIT | [PDF](lectures/lecture-11.pdf) |
| 12 | Neuro-symbolic AI & Type Theory | [PDF](lectures/lecture-12.pdf) |

### Домашние задания

| # | Тема | Формат | Ссылка |
|---|------|--------|--------|
| 1 | Нетипизированное λ-исчисление | LaTeX/PDF | [ДЗ 1](assignments/assignment-1.pdf) |
| 2 | STLC, алгебра типов | LaTeX/PDF | [ДЗ 2](assignments/assignment-2.pdf) |
| 3 | λ2, соответствие Карри–Ховарда | LaTeX/PDF | [ДЗ 3](assignments/assignment-3.pdf) |
| 4 | Coq: базовые доказательства | Coq | [ДЗ 4](assignments/assignment_4.v) |
| 5 | Coq: зависимые типы, Identity types, HoTT | Coq | [ДЗ 5](assignments/assignment_5.v) |

## Система оценивания

*Актуальная схема на семестр (обновлено: декабрь 2025)*

- **5 домашних заданий**, всего 293 балла по обязательным задачам
- Задачи со ⭐ принимаются до конца семестра
- За экзамен можно получить максимум 150 баллов

| Баллы | Оценка | % обязательных |
|-------|--------|----------------|
| 0–101 | 2 | < 35% |
| 102–189 | 3 | ≥ 35% |
| 190–262 | 4 | ≥ 65% |
| 263+ | 5 | ≥ 90% |

## Литература

### Основная
- **Pierce** — *Types and Programming Languages* (TAPL)
- **Nederpelt, Geuvers** — *Type Theory and Formal Proof: An Introduction*

### λ-исчисление и основы
- **Barendregt** — *The Lambda Calculus: Its Syntax and Semantics*
- **Hindley, Seldin** — *Lambda-Calculus and Combinators: An Introduction*
- **Girard, Lafont, Taylor** — *Proofs and Types*
- **Sørensen, Urzyczyn** — *Lectures on the Curry-Howard Isomorphism*

### Coq и формальная верификация
- **Bertot, Castéran** — *Interactive Theorem Proving and Program Development* (Coq'Art)
- **Chlipala** — *Certified Programming with Dependent Types* (CPDT)
- **Mimram** — *Program = Proof*

### Зависимые типы и MLTT
- **Martin-Löf** — *Intuitionistic Type Theory* (Bibliopolis, 1984)
- **Nordström, Petersson, Smith** — *Programming in Martin-Löf's Type Theory*
- **The Agda Wiki** — [сайт](https://wiki.portal.chalmers.se/agda)

### HoTT и унивалентные основания
- **HoTT Book** — *Homotopy Type Theory: Univalent Foundations of Mathematics* — [сайт](https://homotopytypetheory.org/book)
- **Rijke** — *Introduction to Homotopy Type Theory* — [arXiv](https://arxiv.org/abs/2212.11082)

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
- **The Rustonomicon** — [сайт](https://doc.rust-lang.org/nomicon/)
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

## Похожие курсы

### Летние школы
- **Oregon Programming Languages Summer School** (OPLSS) — [сайт](https://www.cs.uoregon.edu/research/summerschool/)
- **DeepSpec Summer School** — [сайт](https://deepspec.org/)
- **HoTTEST Summer School** — [сайт](https://hottest-seminar.github.io/) — онлайн школа по HoTT

### Интерактивные учебники
- **Software Foundations** (UPenn) — [сайт](https://softwarefoundations.cis.upenn.edu) — классика по Coq от B. Pierce
- **Programming Language Foundations in Agda** (PLFA) — [сайт](https://plfa.github.io/) — теория типов на Agda
- **Certified Programming with Dependent Types** (MIT) — [сайт](http://adam.chlipala.net/cpdt/) — продвинутый курс A. Chlipala
- **Introduction to Univalent Foundations** (Birmingham) — [сайт](https://www.cs.bham.ac.uk/~mhe/HoTT-UF-in-Agda-Lecture-Notes/) — HoTT на Agda, M. Escardó

### Университетские курсы
- **15-814 Types and Programming Languages** (CMU) — [сайт](https://www.cs.cmu.edu/~rwh/courses/typesys/) — R. Harper
- **98-317 Hype for Types** (CMU) — [сайт](https://hypefortypes.github.io/) — студенческий курс по теории типов
- **Homotopy Type Theory** (CMU) — [сайт](https://www.cs.cmu.edu/~rwh/courses/hott/) — HoTT от R. Harper
- **Homotopy Type Theory** (École Polytechnique) — [сайт](https://www.lix.polytechnique.fr/Labo/Samuel.Mimram/teaching/hott/) — S. Mimram
- **Homotopy Type Theory** (Ljubljana) — [сайт](https://github.com/andrejbauer/homotopy-type-theory-course) — A. Bauer
- **Functional Programming** (Chalmers) — [сайт](https://www.cse.chalmers.se/edu/course/TDA452/) — известный курс по Haskell и Agda
- **Функциональное программирование** (CSC/ВШЭ) — [YouTube](https://www.youtube.com/watch?v=0h3Ot1C0d2I&list=PLlb7e2G7aSpTDub2LFDVBvvjWj-53Gfuh) — другой известный курс по функциональному программированию от Д.Н. Москвина
- **Semantics of Programming Languages** (Cambridge) — [сайт](https://www.cl.cam.ac.uk/teaching/current/Semantics/) — Part II Tripos
- **Introduction to HoTT** (Ljubljana) — [YouTube](https://www.youtube.com/playlist?list=PL1-2D_rCQBarjdqnM21sOsx09CtFSVO6Z) — A. Bauer

## Контакты

**Воронов Михаил Сергеевич**  
michail.vms [at] gmail.com

---

*«Типы — это исполнимые спецификации: что запрещено — не скомпилируется»*

