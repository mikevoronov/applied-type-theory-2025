From mathcomp Require Import ssreflect ssrfun ssrbool eqtype ssrnat div.
Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

(*
Prop: Type_1
Set: Type_1

Set = Type_0'
Prop = Type_0''

Type_{i} \in Type_{i+1}

Coq is based on CoC + inductive types
*)

Inductive bool: Type :=
    | true
    | false.

Check bool.

Check true.

Definition negb (b: bool): bool :=
    match b with 
    | true => false
    | false => true
    end.

Check negb.

Definition andb (b1: bool) (b2: bool): bool :=
    match b1 with
    | true => b2
    | false => false
    end.

Check andb.

Compute negb true.

Compute (andb true true).

Notation "x && y" := (andb x y).

Check nat.
Print nat.

Print eq.

Check S (S O).

Definition predn (n: nat): nat :=
    match n with
    | O => O
    | S x => x
    end.

Compute (predn (S (S O))).

Fixpoint addn (n m: nat) {struct n}: nat :=
    match n with
    | O => m
    | S k => S (addn k m)
    end.

Compute (addn (S(S(S(O)))) (S(S(O)))).

Theorem plus_0_n: forall n: nat, 0 + n = n.
Proof.
    intros n.
    reflexivity.
    Show Proof.
Qed.

Lemma plus_id_1: forall n m: nat, n = m -> n + n = m + m.
Proof.
    intros n m.
    intros H.
    rewrite H.
    reflexivity.
    Show Proof.
Qed.

Check eq_ind_r.

Theorem plus_id_2: forall n m o: nat, n = m -> m = o -> n + m = m + o.
Proof.
    intros n m o.
    intros H1 H2.
    rewrite -> H1.
    rewrite <- H2.
    reflexivity.
Qed.

Fixpoint eqb (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => eqb n' m'
            end
  end.

Notation "x =? y" := (eqb x y) (at level 100) : nat_scope.

Theorem plus_1_neq_0: forall n: nat,
    ((n + 1) =? 0) = false.
Proof.
    intros n.
    destruct n as [| n'].
    {
        reflexivity.
    }
    - reflexivity.
    Show Proof.
Qed.

Print nat.

Theorem and_commute: forall a b, andb a b = andb b a.
Proof.
    intros a b.
    destruct a eqn:Ea.
    {
        destruct b eqn:Eb.
        - reflexivity.
        - reflexivity.
    }
    {
        destruct b eqn:Eb.
        - reflexivity.
        - reflexivity.
    }
    Show Proof.
Qed.    
    
Theorem aaaa: 3+4 = 7 /\ 2*2 = 4.
Proof.
    split.
    - reflexivity.
    - reflexivity.
    Show Proof.
Qed.

Theorem aaa_2: forall n m: nat, n = 0 /\ m = 0 -> n + m = 0.
Proof.
    intros n m.
    intros H.
    destruct H as [Hl Hr].
    rewrite -> Hl.
    rewrite -> Hr.
    reflexivity.
    Show Proof.
Qed.

Variables A B C: Prop.

Theorem andA: (A /\ B) /\ C -> A /\ (B /\ C).
Proof.
    case.
    case.
    move => a b c.
    split.
    - exact a.
    split.
     - exact b.
     - exact c.
    Show Proof.
Qed.
    
Theorem dist_conjD: A \/ (B /\ C) -> (A \/ B) /\ (A \/ C).
Proof.
    case.
    {
        move => a.
        split.
        - left.
        - exact a.
        + left.
        + exact a.
    }
    {
        case.
        move => b c.
        split.
        - right.
        - exact b.
        + right.
        + exact c.
    }
Qed.
