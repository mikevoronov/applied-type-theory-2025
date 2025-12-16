(*
  Домашнее задание 5 (Coq: параметрический полиморфизм, зависимые типы, identity types)
  
  Дедлайн: 27 декабря 2025, 23:59
  Задачи со звёздочкой принимаются до конца семестра.
  
  Сдача: файл .v на почту m.voronov@gse.cs.msu.ru
  Вопросы: по почте или в ТГ-группе курса.
*)

Require Import Arith.

Module Assignment5.

(* Заглушка для незаполненных определений — замените на реальный код *)
Axiom todo : forall {A : Type}, A.

(*
============================================================
1. Списки: определения и базовые теоремы
============================================================
*)

Inductive List (A: Type): Type :=
| Nil: List A
| Cons: A -> List A -> List A.

Arguments Nil {A}.
Arguments Cons {A}.

Fixpoint append {A : Type} (left right: List A): List A :=
    match left with
    | Nil => right
    | Cons head tail => Cons head (append tail right)
    end.

(* 1 балл *)
Theorem append_nil_l {A: Type}:
    forall (u: List A), append Nil u = u.
Proof.
Admitted.

(* 3 балла *)
Theorem append_nil_r {A: Type}:
    forall (u: List A), append u Nil = u.
Proof.
Admitted.

(* 3 балла *)
Theorem append_assoc {A: Type}:
    forall (u v w: List A),
    append (append u v) w = append u (append v w).
Proof.
Admitted.

Fixpoint list_length {A: Type} (l: List A): nat :=
    match l with
    | Nil => O
    | Cons head tail => S (list_length tail)
    end.

(* 3 балла *)
Theorem append_length {A: Type}: forall (l1 l2: List A),
    list_length (append l1 l2) = (list_length l1) + (list_length l2).
Proof.
Admitted.

(*
============================================================
2. Разворот списка
============================================================
*)

Fixpoint rev {A: Type} (l: List A) : List A :=
    match l with
    | Nil => Nil
    | Cons head tail => append (rev tail) (Cons head Nil)
    end.

(* 3 балла *)
Theorem rev_append {A: Type}: forall (u v: List A),
    rev (append u v) = append (rev v) (rev u).
Proof.
Admitted.

(* 3 балла *)
Theorem rev_involutive {A: Type}: forall (l: List A),
    rev (rev l) = l.
Proof.
Admitted.

(* 3 балла *)
Theorem rev_length {A: Type}: forall (l: List A),
    list_length (rev l) = list_length l.
Proof.
Admitted.

(*
============================================================
3. Векторы: списки с длиной в типе
============================================================

Это пример зависимых типов из лекции 9-10:
Vector A n — список элементов типа A длины ровно n.
*)

Inductive Vector (A: Type): nat -> Type :=
 | VNil: Vector A 0
 | VCons : forall n, A -> Vector A n -> Vector A (S n).

Arguments VNil {A}.
Arguments VCons {A} {n}.

(* 3 балла: приведение вектора при равенстве индексов *)
Definition cast_vector {A: Type} {m n: nat}:
    Vector A m -> m = n -> Vector A n.
Proof.
Admitted.

(* 3 балла: безопасный head — работает только для непустых векторов *)
Definition vhead {A: Type} {n: nat} (v: Vector A (S n)): A.
Proof.
Admitted.

Fixpoint vappend {A: Type} {m n: nat} 
    (v1: Vector A m) (v2: Vector A n): Vector A (m + n) :=
    match v1 with
    | VNil => v2
    | VCons x xs => VCons x (vappend xs v2)
    end.

(* 
   4 балла: разворот вектора
   
   Подсказка: используйте vappend и cast_vector, или 
   вспомогательную функцию с аккумулятором.
*)
Definition vrev {A: Type} {n: nat} (v: Vector A n): Vector A n.
Proof.
Admitted.

(*
============================================================
4. (4 балла) Сумма натуральных чисел
============================================================
*)

Fixpoint sum_to (n: nat): nat :=
    match n with
    | O => O
    | S m => n + sum_to m
    end.

(* 
   Докажите формулу Гаусса: 1 + 2 + ... + n = n * (n + 1) / 2
   
   Поскольку у нас целочисленная арифметика, будем доказывать эквивалентную форму:
   2 * sum_to n = n * (n + 1)
*)

Theorem gauss_formula: forall n: nat,
    2 * sum_to n = n * (n + 1).
Proof.
Admitted.

(*
============================================================
5. J-элиминатор (identity elimination)
============================================================

Это фундаментальный принцип из лекции: J позволяет 
доказывать свойства равенств, зная только случай refl.

"Based" форма J (как на лекции) — x фиксирован:
*)

Section J_Eliminator.
    Variable A: Type.

    (* J-элиминатор: реализация дана, изучите её! *)
    Definition J_eq
        (x: A)
        (P : forall y:A, x=y -> Type)
        (d : P x eq_refl)
        (y: A)
        (p: x = y): P y p :=
        match p in (_ = y') return P y' p with
        | eq_refl => d
        end.

    (* Проверка: J вычисляется на refl *)
    Lemma J_eq_beta:
        forall (x: A) (P: forall y:A, x=y -> Type) (d: P x eq_refl),
            J_eq x P d x eq_refl = d.
    Proof. reflexivity. Qed.

    (* 
       Симметричность и транзитивность были на лекции — 
       вот готовые определения для справки:
    *)
    Definition sym_J (x y: A) (p: x = y): y = x := 
        J_eq x (fun y _ => y = x) eq_refl y p.

    Definition trans_J (x y z: A) (p1: x = y) (p2: y = z): x = z := 
        J_eq y (fun z _ => x = z) p1 z p2.

(*
Transport — ключевая операция: если x = y и P x, то P y.
Это "перенос" свойства/данных вдоль пути равенства.

*)

(* (2 балла) реализуйте транспорт *)
Definition transport_via_J (P: A -> Type) (x y: A) (p: x = y) (u: P x): P y :=
    todo.

(* Докажите следующие свойства (можно использовать J_eq или tactics): *)

(* (2 балла) Инволютивность sym: (p⁻¹)⁻¹ = p *)
Lemma sym_sym (x y: A) (p: x = y): sym_J y x (sym_J x y p) = p.
Proof.
Admitted.

(* (2 балла) левая единица для trans: refl · p = p *)
Lemma trans_refl_l (x y: A) (p: x = y): trans_J x x y eq_refl p = p.
Proof.
Admitted.

End J_Eliminator.

(*
============================================================
6. UIP и K-аксиома
============================================================

UIP (Uniqueness of Identity Proofs): все доказательства равенства
между одними и теми же элементами равны между собой.

Это НЕ выводимо в общем случае в Coq, но выводимо для типов
с разрешимым равенством (теорема Хедберга).

Докажите UIP для nat, используя разрешимость равенства.
*)

(* Вспомогательное: равенство nat разрешимо *)
Definition nat_eq_dec : forall m n: nat, {m = n} + {m <> n} := Nat.eq_dec.

(* (3 балла) Теперь докажите UIP для nat *)
Theorem UIP_nat: forall (n m: nat) (p q: n = m), p = q.
Proof.
    (* Подсказка: Require Import Eqdep_dec. и посмотрите на UIP_dec *)
Admitted.

(*
K-аксиома (Streicher's K): чтобы доказать P p для любого p : x = x,
достаточно доказать P eq_refl.

Это "индукция по петлям" — мы можем предполагать, что петля тривиальна.
*)

Definition K_nat := forall (n: nat) (P: n = n -> Prop),
    P eq_refl -> forall p: n = n, P p.

(* (3 балла) выведите K из UIP *)
Theorem UIP_implies_K: 
    (forall n m: nat, forall p q: n = m, p = q) -> K_nat.
Proof.
Admitted.

(* 3 (балла) выведите UIP из K (для рефлексивного случая) *)
Theorem K_implies_UIP_refl:
    K_nat -> forall (n: nat) (p: n = n), p = eq_refl.
Proof.
Admitted.

(*
Вы только что доказали UIP и K для nat, но в HoTT эти принципы не выполняются в общем случае.
Объясните своими словами (3-5 предложений):

a) Почему UIP (все p, q : x = y равны) противоречит существованию 
   нетривиальных петель в S¹?

b) Что это означает для математики: почему в HoTT "равенство" 
   богаче, чем просто "да/нет"?

*)

(*
ОТВЕТ НА ЗАДАНИЕ 6:

a) Почему UIP не совместим с S¹:


b) Что это даёт математике:


*)


(*
============================================================
7. (6 баллов) Объясните простыми словами для семилетнего ребёнка:
============================================================

a) (3 балла) Что такое "высшие индуктивные типы" (HIT)?
   Объясните ребёнку, что значит "добавить путь в тип"?

b) (3 балла) Что такое "унивалентность" (Univalence Axiom)?
   Объясните: почему это полезно? Почему математики хотят считать
   изоморфные структуры "одним и тем же"?

Напишите ваши объяснения в комментарии ниже:
*)

(*
ОТВЕТ НА ЗАДАНИЕ 7:

a) Высшие индуктивные типы (HIT):


b) Унивалентность:


*)


(*
============================================================
8. (15 баллов)* Encode-Decode: характеризация равенства в nat
============================================================

Это классическая техника из HoTT Book (Chapter 2).

Идея: вместо работы с абстрактным типом (m = n) мы строим
конкретный тип code m n, который "кодирует" равенство.

Для nat: code m n говорит "m и n равны", но в вычислимой форме.
*)

(* Шаг 1: определите code — "вычислимое равенство" *)
Fixpoint code (m n: nat) : Type :=
    match m, n with
    | O, O => True
    | S m', S n' => code m' n'
    | _, _ => False
    end.

(* Шаг 2: рефлексивность code *)
(* (2 балла) *)
Fixpoint code_refl (n: nat) : code n n :=
    todo.

(* Шаг 3: encode — из равенства в code *)
(* (3 балла) Подсказка: используйте transport или destruct p *)
Definition encode (m n: nat) (p: m = n) : code m n :=
    todo.

(* Шаг 4: decode — из code в равенство *)
(* (5 баллов) Подсказка: индукция по m и n одновременно *)
Fixpoint decode (m n: nat) : code m n -> m = n :=
    todo.

(* Шаг 5: покажите, что encode и decode — взаимные обратные *)
(* (5 баллов) Это доказывает, что (m = n) ≃ code m n *)

Theorem encode_decode : forall m n (c: code m n),
    encode m n (decode m n c) = c.
Proof.
Admitted.

Theorem decode_encode : forall m n (p: m = n),
    decode m n (encode m n p) = p.
Proof.
Admitted.

(*
Методологическое замечание.

Для типа nat функция code принимает значения в подобъектном 
классификаторе {True, False}, что отражает разрешимость равенства.
Однако для высших индуктивных типов ситуация существенно иная:
в случае окружности S¹ имеем code(base, base) ≃ ℤ, где целое 
число n кодирует n-кратную композицию образующей loop : base = base.
Результирующая эквивалентность (base =_{S¹} base) ≃ ℤ есть не что 
иное, как вычисление фундаментальной группы π₁(S¹) = ℤ методами 
теории типов. Принцип UIP несовместим с данной конструкцией, 
поскольку отождествление всех элементов типа (base = base) 
привело бы к коллапсу ℤ в тривиальную группу.
*)

(*
============================================================
9. (26 баллов)* Multi-Head Attention: типобезопасные тензоры
============================================================

Это задание связывает теорию типов с современными нейросетями.
Мы формализуем механизм внимания из "Attention Is All You Need" (2017).

Ключевая идея: зависимые типы гарантируют корректность размерностей
на этапе компиляции — как если бы PyTorch проверял shape errors статически.

В реальных ML-библиотеках ошибки размерностей — одна из самых частых 
проблем. Здесь мы покажем, как типы решают эту проблему.
*)

Section Attention.

(* 
   Матрица как вектор векторов с размерностями в типе.
   Matrix A rows cols — матрица элементов A размером rows × cols.
   
   Это прямое обобщение Vector из задания 3.
*)
Definition Matrix (A: Type) (rows cols: nat) := Vector (Vector A cols) rows.

(* Вспомогательное: доступ к элементу вектора по индексу *)
(* Fin n — тип "числа меньше n", гарантирует bounds safety *)
Inductive Fin : nat -> Type :=
| FZ : forall {n}, Fin (S n)
| FS : forall {n}, Fin n -> Fin (S n).

(* Безопасный доступ по индексу — невозможен out-of-bounds *)
Fixpoint vget {A: Type} {n: nat} (v: Vector A n) (i: Fin n): A :=
    match i in Fin n' return Vector A n' -> A with
    | FZ => fun v' => vhead v'
    | FS i' => fun v' => 
        match v' with
        | VCons _ xs => vget xs i'
        | VNil => todo (* невозможный случай *)
        end
    end v.

(*
Часть A: Softmax и распределение вероятностей (8 баллов)

Softmax превращает логиты в распределение вероятностей:
softmax(x)_i = exp(x_i) / Σ_j exp(x_j)

Attention scores после softmax интерпретируются как "веса внимания".
*)

(* Применение функции к каждому элементу вектора *)
Fixpoint vmap {A B: Type} {n: nat} (f: A -> B) (v: Vector A n): Vector B n :=
    match v with
    | VNil => VNil
    | VCons x xs => VCons (f x) (vmap f xs)
    end.

(* Сумма элементов вектора натуральных чисел *)
Fixpoint vsum {n: nat} (v: Vector nat n): nat :=
    match v with
    | VNil => 0
    | VCons x xs => x + vsum xs
    end.

(* 
   Тип "нормализованный вектор" — сумма элементов = total.
   Это refinement type: вектор + доказательство свойства.
   
   Прямая связь с лекцией 9 (Σ-типы) и лекцией 12 (structured generation).
*)
Definition NormalizedVec (n total: nat) := 
    { v: Vector nat n | vsum v = total }.

(* (2 балла) Постройте нормализованный вектор длины 2 с суммой 100 *)
(* Это "proof-carrying data" — данные с доказательством свойства *)
Definition example_normalized : NormalizedVec 2 100.
Proof.
    (* Подсказка: нужно предъявить вектор и доказать, что его сумма = 100 *)
Admitted.

(* 
   (4 балла) Докажите, что конкатенация сохраняет сумму.
   
   Если v1 нормализован с суммой s1, v2 с суммой s2,
   то (v1 ++ v2) нормализован с суммой s1 + s2.
*)
Theorem vsum_append: forall {m n: nat} (v1: Vector nat m) (v2: Vector nat n),
    vsum (vappend v1 v2) = vsum v1 + vsum v2.
Proof.
Admitted.

(*
Часть B: Типобезопасное умножение матриц (6 баллов)

Умножение (m × n) @ (n × p) даёт (m × p).
Ключевое: внутренняя размерность n должна совпадать.
*)

(* Скалярное произведение векторов одинаковой длины *)
Fixpoint dot {n: nat} (v1 v2: Vector nat n): nat :=
    match v1 in Vector _ n' return Vector nat n' -> nat with
    | VNil => fun _ => 0
    | VCons x xs => fun v2' =>
        match v2' with
        | VCons y ys => x * y + dot xs ys
        | VNil => 0 (* невозможно по типу *)
        end
    end v2.

(*
   (6 баллов) Реализуйте умножение матриц с правильным типом.
   
   Тип гарантирует: (m × n) @ (n × p) → (m × p)
   Невозможно вызвать с несовместимыми размерностями!
*)
Definition mat_mul {m n p: nat}
    (A: Matrix nat m n) (B: Matrix nat n p): Matrix nat m p.
Proof.
    (* Подсказка: 
       1. Для каждой строки A и каждого столбца B вычислите dot product
       2. Понадобится транспонирование B или извлечение столбцов
       3. Используйте vget или определите вспомогательные функции
    *)
Admitted.

(*
Часть C: Multi-Head Attention (6 баллов)

MultiHead(Q, K, V) = Concat(head_1, ..., head_h) @ W_O

Каждая голова имеет размерность d_head = d_model / h.
После конкатенации h голов получаем d_model = h * d_head.

Ключевой инвариант: размерности должны "сойтись".
*)

(* Тип для одной головы внимания: матрица seq_len × d_head *)
Definition AttentionHead (seq_len d_head: nat) := Matrix nat seq_len d_head.

(* 
   (6 баллов) Реализуйте конкатенацию голов.
   
   h голов размерности (seq_len × d_head) → одна матрица (seq_len × (h * d_head))
   
   Тип гарантирует корректность: d_model = h * d_head — не runtime проверка,
   а следствие из типов!
*)
Definition concat_heads {seq_len h d_head: nat}
    (heads: Vector (AttentionHead seq_len d_head) h)
    : Matrix nat seq_len (h * d_head).
Proof.
    (* Подсказка:
       1. Для каждой позиции seq конкатенируйте соответствующие строки всех голов
       2. Можете использовать vappend и доказать, что размерности совпадают
       3. Понадобится лемма о связи h * d_head и конкатенации
    *)
Admitted.

End Attention.

(*
============================================================
Теоретические вопросы (обязательно ответить для получения баллов):
============================================================

a) (2 балла) Почему тип mat_mul делает невозможной ошибку 
   "shapes cannot be multiplied"? Как это связано с Curry-Howard?

b) (2 балла) NormalizedVec — это Σ-тип (зависимая пара).
   Как это связано с Proof-Carrying Data из лекции 12?

c) (2 балла) В PyTorch размерности проверяются в runtime.
   Какие преимущества и недостатки у compile-time проверки через типы?

*)

(*
ОТВЕТ НА ЗАДАНИЕ 9:

a) Типы и ошибки размерностей:


b) NormalizedVec и Proof-Carrying Data:


c) Compile-time vs runtime проверка размерностей:


*)

End Assignment5.
