Inductive Nat: Type :=
  | O: Nat
  | S: Nat -> Nat.

Check Nat_rec.

Fixpoint add_l (n m :Nat) : Nat :=
    match n with 
    | O => m
    | S n' => S(add_l n' m)
end.

Fixpoint add_r (n m :Nat) : Nat :=
    match m with 
    | O => n
    | S m' => S(add_r n m')
end.

Theorem plus_0_n: forall n: Nat, add_l O n = n.
Proof.
    intros n.
    reflexivity.
    Show Proof.
Qed.

Theorem plus_n_0aaa: forall n: Nat, add_r n O = n.
Proof.
    intros n.
    reflexivity.
    Show Proof.
Qed.

Theorem plus_n_0: forall n: Nat, add_l n O = n.
Proof.
    induction n.
    -
        simpl.
        reflexivity.
    -
        simpl.
        rewrite IHn.
        reflexivity.
Qed.

Inductive Vector (A : Type): Nat -> Type :=
| Nil: Vector A O
| Cons n: A -> Vector A n -> Vector A (S n).

Check Nil.
Check Cons.

Compute Cons nat O 5 (Nil nat).

Fixpoint vector_append {A : Type} {v1_len: Nat} {v2_len: Nat}
    (v1: Vector A v1_len) (v2: Vector A v2_len): Vector A (add_l v1_len v2_len) :=
    match v1 with
    | Nil _ => v2
    | Cons _ _ elem v1' => Cons _ _ elem (vector_append v1' v2)
end.

Fail Fixpoint vector_append_2 {A : Type} {v1_len: Nat} {v2_len: Nat}
    (v1: Vector A v1_len) (v2: Vector A v2_len): Vector A (add_l v1_len v2_len) :=
    match v1 with
    | Nil _ => v1
    | Cons _ _ elem v1' => Cons _ _ elem (vector_append_2 v1' v2)
end.

Check vector_append.

Fixpoint vector_append_3 {A : Type} {v1_len: Nat} {v2_len: Nat}
    (v1: Vector A v1_len) (v2: Vector A v2_len): Vector A (add_l v1_len v2_len).
Proof.
    refine (
        match v1 in Vector _ v1_len'
            return v1_len = v1_len' -> Vector A (add_l v1_len v2_len)
        with 
            | Nil _ => _
            | Cons _ _ elem v => _
            end eq_refl
    ).
    -
         intros.
         rewrite H.
         simpl.
         exact (v2).
    -
        intros H.
        rewrite H.
        exact (Cons _ _ elem (vector_append_3 _ _ _ v v2)).
    Show Proof.
Qed.


Section J_Eliminator.

    Variable A: Type.

    Definition J_eq
        (x: A)
        (P : forall y:A, x=y -> Type)
        (d : P x eq_refl)
        (y: A)
        (p: x = y): P y p :=
        match p in (_ = y') return P y' p with
        | eq_refl => d
        end.

    Lemma J_eq_beta:
        forall (x: A)
               (P: forall y:A, x=y -> Type)
               (d: P x eq_refl),
            J_eq x P d x eq_refl = d.
    Proof.
        intros.
        simpl.
        reflexivity.
    Qed.

    (*
       sym_J: x = y -> y = x

       P x p = y = x
    *)
    Definition sym_J (x y: A) (p: x = y): y = x := 
        J_eq x (fun y _ => y = x) eq_refl y p.
    
    (*
       trans_J: x = y, y = z -> x = z

       P z q := x = z
    *)
    Definition trans_J (x y z: A) (p1: x = y) (p2: y=z): x = z := 
        J_eq y (fun z _ => x = z) p1 z p2.


    (*
          u: P x -> P y
    *)
    Definition transport_J
        (P: A -> Type)
        (x y: A)
        (p: x = y)
        (u: P x): P y :=
        J_eq x (fun y _ => P y) u y p.

    (*
        \forall f: A -> B, x = y -> f x = f y

        P y, p := f x = f y
    *)
    Variable B: Type.
    Variable f: A -> B.

    Definition ap_J (x y: A) (p: x = y) : f x = f y :=
        J_eq x (fun y _ => f x = f y) eq_refl y p.


End J_Eliminator.
    