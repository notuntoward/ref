---
category:
  - "[[Clippings]]"
title: Mutual information - Wikipedia
source: https://en.wikipedia.org/wiki/Mutual_information
author:
  - "[[Wikipedia]]"
created: 2025-01-31
description: 
tags:
  - clippings
  - wikipedia
created date: 2025-01-31T16:44:19-08:00
modified date: 2025-01-31T17:15:18-08:00
---
| [Information theory](https://en.wikipedia.org/wiki/Information_theory "Information theory")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [![[Clippings/attachments/673e3898b72e33125e5dcb2278f3cd42_MD5.png]]](https://en.wikipedia.org/wiki/File:Binaryerasurechannel.png)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| - [Entropy](https://en.wikipedia.org/wiki/Entropy_\(information_theory\) "Entropy (information theory)") - [Differential entropy](https://en.wikipedia.org/wiki/Differential_entropy "Differential entropy") - [Conditional entropy](https://en.wikipedia.org/wiki/Conditional_entropy "Conditional entropy") - [Joint entropy](https://en.wikipedia.org/wiki/Joint_entropy "Joint entropy") - Mutual information - [Directed information](https://en.wikipedia.org/wiki/Directed_information "Directed information") - [Conditional mutual information](https://en.wikipedia.org/wiki/Conditional_mutual_information "Conditional mutual information") - [Relative entropy](https://en.wikipedia.org/wiki/Relative_entropy "Relative entropy") - [Entropy rate](https://en.wikipedia.org/wiki/Entropy_rate "Entropy rate") - [Limiting density of discrete points](https://en.wikipedia.org/wiki/Limiting_density_of_discrete_points "Limiting density of discrete points") |
| - [Asymptotic equipartition property](https://en.wikipedia.org/wiki/Asymptotic_equipartition_property "Asymptotic equipartition property") - [Rate–distortion theory](https://en.wikipedia.org/wiki/Rate%E2%80%93distortion_theory "Rate–distortion theory")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| - [Shannon's source coding theorem](https://en.wikipedia.org/wiki/Shannon%27s_source_coding_theorem "Shannon's source coding theorem") - [Channel capacity](https://en.wikipedia.org/wiki/Channel_capacity "Channel capacity") - [Noisy-channel coding theorem](https://en.wikipedia.org/wiki/Noisy-channel_coding_theorem "Noisy-channel coding theorem") - [Shannon–Hartley theorem](https://en.wikipedia.org/wiki/Shannon%E2%80%93Hartley_theorem "Shannon–Hartley theorem")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| - [v](https://en.wikipedia.org/wiki/Template:Information_theory "Template:Information theory") - [t](https://en.wikipedia.org/wiki/Template_talk:Information_theory "Template talk:Information theory") - [e](https://en.wikipedia.org/wiki/Special:EditPage/Template:Information_theory "Special:EditPage/Template:Information theory")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

![[Clippings/attachments/0d67b76cd9d3479b852c255d4b80eeaf_MD5.png]]

[Venn diagram](https://en.wikipedia.org/wiki/Venn_diagram "Venn diagram") showing additive and subtractive relationships of various information measures associated with correlated variables ${\displaystyle X}$ and ${\displaystyle Y}$  .[^1] The area contained by either circle is the [joint entropy](https://en.wikipedia.org/wiki/Joint_entropy "Joint entropy") ${\displaystyle \mathrm {H} (X,Y)}$  . The circle on the left (red and violet) is the [individual entropy](https://en.wikipedia.org/wiki/Entropy_\(information_theory\) "Entropy (information theory)") ${\displaystyle \mathrm {H} (X)}$  , with the red being the [conditional entropy](https://en.wikipedia.org/wiki/Conditional_entropy "Conditional entropy") ${\displaystyle \mathrm {H} (X\mid Y)}$  . The circle on the right (blue and violet) is ${\displaystyle \mathrm {H} (Y)}$  , with the blue being ${\displaystyle \mathrm {H} (Y\mid X)}$  . The violet is the mutual information ${\displaystyle \operatorname {I} (X;Y)}$  .

In [probability theory](https://en.wikipedia.org/wiki/Probability_theory "Probability theory") and [information theory](https://en.wikipedia.org/wiki/Information_theory "Information theory"), the **mutual information** (**MI**) of two [random variables](https://en.wikipedia.org/wiki/Random_variable "Random variable") is a measure of the mutual [dependence](https://en.wikipedia.org/wiki/Statistical_dependence "Statistical dependence") between the two variables. More specifically, it quantifies the "[amount of information](https://en.wikipedia.org/wiki/Information_content "Information content")" (in [units](https://en.wikipedia.org/wiki/Units_of_information "Units of information") such as [shannons](https://en.wikipedia.org/wiki/Shannon_\(unit\) "Shannon (unit)") ([bits](https://en.wikipedia.org/wiki/Bit "Bit")), [nats](https://en.wikipedia.org/wiki/Nat_\(unit\) "Nat (unit)") or [hartleys](https://en.wikipedia.org/wiki/Hartley_\(unit\) "Hartley (unit)")) obtained about one random variable by observing the other random variable. The concept of mutual information is intimately linked to that of [entropy](https://en.wikipedia.org/wiki/Entropy_\(information_theory\) "Entropy (information theory)") of a random variable, a fundamental notion in information theory that quantifies the expected "amount of information" held in a random variable.

Not limited to real-valued random variables and linear dependence like the [correlation coefficient](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient "Pearson correlation coefficient"), MI is more general and determines how different the [joint distribution](https://en.wikipedia.org/wiki/Joint_distribution "Joint distribution") of the pair ${\displaystyle (X,Y)}$ is from the product of the marginal distributions of ${\displaystyle X}$ and ${\displaystyle Y}$  . MI is the [expected value](https://en.wikipedia.org/wiki/Expected_value "Expected value") of the [pointwise mutual information](https://en.wikipedia.org/wiki/Pointwise_mutual_information "Pointwise mutual information") (PMI).

The quantity was defined and analyzed by [Claude Shannon](https://en.wikipedia.org/wiki/Claude_Shannon "Claude Shannon") in his landmark paper "[A Mathematical Theory of Communication](https://en.wikipedia.org/wiki/A_Mathematical_Theory_of_Communication "A Mathematical Theory of Communication")", although he did not call it "mutual information". This term was coined later by [Robert Fano](https://en.wikipedia.org/wiki/Robert_Fano "Robert Fano").[^2] Mutual Information is also known as [information gain](https://en.wikipedia.org/wiki/Information_gain "Information gain").

## Definition

Let ${\displaystyle (X,Y)}$ be a pair of [random variables](https://en.wikipedia.org/wiki/Random_variable "Random variable") with values over the space ${\displaystyle {\mathcal {X}}\times {\mathcal {Y}}}$  . If their joint distribution is ${\displaystyle P_{(X,Y)}}$ and the marginal distributions are ${\displaystyle P_{X}}$ and ${\displaystyle P_{Y}}$  , the mutual information is defined as

${\displaystyle I(X;Y)=D_{\mathrm {KL} }(P_{(X,Y)}\|P_{X}\otimes P_{Y})}$ 

where ${\displaystyle D_{\mathrm {KL} }}$ is the [Kullback–Leibler divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence "Kullback–Leibler divergence"), and ${\displaystyle P_{X}\otimes P_{Y}}$ is the [outer product](https://en.wikipedia.org/wiki/Outer_product "Outer product") distribution which assigns probability ${\displaystyle P_{X}(x)\cdot P_{Y}(y)}$ to each ${\displaystyle (x,y)}$  .

Notice, as per property of the [Kullback–Leibler divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence "Kullback–Leibler divergence"), that ${\displaystyle I(X;Y)}$ is equal to zero precisely when the joint distribution coincides with the product of the marginals, i.e. when ${\displaystyle X}$ and ${\displaystyle Y}$ are independent (and hence observing ${\displaystyle Y}$ tells you nothing about ${\displaystyle X}$  ). ${\displaystyle I(X;Y)}$ is non-negative, it is a measure of the price for encoding ${\displaystyle (X,Y)}$ as a pair of independent random variables when in reality they are not.

If the [natural logarithm](https://en.wikipedia.org/wiki/Natural_logarithm "Natural logarithm") is used, the unit of mutual information is the [nat](https://en.wikipedia.org/wiki/Nat_\(unit\) "Nat (unit)"). If the [log base](https://en.wikipedia.org/wiki/Logarithm "Logarithm") 2 is used, the unit of mutual information is the [shannon](https://en.wikipedia.org/wiki/Shannon_\(unit\) "Shannon (unit)"), also known as the bit. If the [log base](https://en.wikipedia.org/wiki/Logarithm "Logarithm") 10 is used, the unit of mutual information is the [hartley](https://en.wikipedia.org/wiki/Hartley_\(unit\) "Hartley (unit)"), also known as the ban or the dit.

### In terms of PMFs for discrete distributions

The mutual information of two jointly discrete random variables ${\displaystyle X}$ and ${\displaystyle Y}$ is calculated as a double sum:[^cover1991-3] 

| ${\displaystyle \operatorname {I} (X;Y)=\sum _{y\in {\mathcal {Y}}}\sum _{x\in {\mathcal {X}}}{P_{(X,Y)}(x,y)\log \left({\frac {P_{(X,Y)}(x,y)}{P_{X}(x)\,P_{Y}(y)}}\right)},}$ |  | Eq.1 |
| --- | --- | --- |

where ${\displaystyle P_{(X,Y)}}$ is the [joint probability *mass* function](https://en.wikipedia.org/wiki/Joint_distribution "Joint distribution") of ${\displaystyle X}$ and ${\displaystyle Y}$  , and ${\displaystyle P_{X}}$ and ${\displaystyle P_{Y}}$ are the [marginal probability](https://en.wikipedia.org/wiki/Marginal_probability "Marginal probability") mass functions of ${\displaystyle X}$ and ${\displaystyle Y}$ respectively.

### In terms of PDFs for continuous distributions

In the case of jointly continuous random variables, the double sum is replaced by a [double integral](https://en.wikipedia.org/wiki/Double_integral "Double integral"):[^cover1991-3] 

| ${\displaystyle \operatorname {I} (X;Y)=\int _{\mathcal {Y}}\int _{\mathcal {X}}{P_{(X,Y)}(x,y)\log {\left({\frac {P_{(X,Y)}(x,y)}{P_{X}(x)\,P_{Y}(y)}}\right)}}\;dx\,dy,}$ |  | Eq.2 |
| --- | --- | --- |

where ${\displaystyle P_{(X,Y)}}$ is now the joint probability *density* function of ${\displaystyle X}$ and ${\displaystyle Y}$  , and ${\displaystyle P_{X}}$ and ${\displaystyle P_{Y}}$ are the marginal probability density functions of ${\displaystyle X}$ and ${\displaystyle Y}$ respectively.

## Motivation

Intuitively, mutual information measures the information that ${\displaystyle X}$ and ${\displaystyle Y}$ share: It measures how much knowing one of these variables reduces uncertainty about the other. For example, if ${\displaystyle X}$ and ${\displaystyle Y}$ are independent, then knowing ${\displaystyle X}$ does not give any information about ${\displaystyle Y}$ and vice versa, so their mutual information is zero. At the other extreme, if ${\displaystyle X}$ is a deterministic function of ${\displaystyle Y}$ and ${\displaystyle Y}$ is a deterministic function of ${\displaystyle X}$ then all information conveyed by ${\displaystyle X}$ is shared with ${\displaystyle Y}$  : knowing ${\displaystyle X}$ determines the value of ${\displaystyle Y}$ and vice versa. As a result, the mutual information is the same as the uncertainty contained in ${\displaystyle Y}$ (or ${\displaystyle X}$  ) alone, namely the [entropy](https://en.wikipedia.org/wiki/Information_entropy "Information entropy") of ${\displaystyle Y}$ (or ${\displaystyle X}$  ). A very special case of this is when ${\displaystyle X}$ and ${\displaystyle Y}$ are the same random variable.

Mutual information is a measure of the inherent dependence expressed in the [joint distribution](https://en.wikipedia.org/wiki/Joint_distribution "Joint distribution") of ${\displaystyle X}$ and ${\displaystyle Y}$ relative to the marginal distribution of ${\displaystyle X}$ and ${\displaystyle Y}$ under the assumption of independence. Mutual information therefore measures dependence in the following sense: ${\displaystyle \operatorname {I} (X;Y)=0}$ [if and only if](https://en.wikipedia.org/wiki/If_and_only_if "If and only if") ${\displaystyle X}$ and ${\displaystyle Y}$ are independent random variables. This is easy to see in one direction: if ${\displaystyle X}$ and ${\displaystyle Y}$ are independent, then ${\displaystyle p_{(X,Y)}(x,y)=p_{X}(x)\cdot p_{Y}(y)}$  , and therefore:

${\displaystyle \log {\left({\frac {p_{(X,Y)}(x,y)}{p_{X}(x)\,p_{Y}(y)}}\right)}=\log 1=0.}$ 

Moreover, mutual information is nonnegative (i.e. ${\displaystyle \operatorname {I} (X;Y)\geq 0}$ see below) and [symmetric](https://en.wikipedia.org/wiki/Symmetric_function "Symmetric function") (i.e. ${\displaystyle \operatorname {I} (X;Y)=\operatorname {I} (Y;X)}$ see below).

## Properties

### Nonnegativity

Using [Jensen's inequality](https://en.wikipedia.org/wiki/Jensen%27s_inequality "Jensen's inequality") on the definition of mutual information we can show that ${\displaystyle \operatorname {I} (X;Y)}$ is non-negative, i.e.[^cover1991-3] 

${\displaystyle \operatorname {I} (X;Y)\geq 0}$ 

### Symmetry

${\displaystyle \operatorname {I} (X;Y)=\operatorname {I} (Y;X)}$ 

The proof is given considering the relationship with entropy, as shown below.

### Supermodularity under independence

If ${\displaystyle C}$ is independent of ${\displaystyle (A,B)}$  , then

${\displaystyle \operatorname {I} (Y;A,B,C)-\operatorname {I} (Y;A,B)\geq \operatorname {I} (Y;A,C)-\operatorname {I} (Y;A)}$  .[^4]

### Relation to conditional and joint entropy

Mutual information can be equivalently expressed as:

${\displaystyle {\begin{aligned}\operatorname {I} (X;Y)&{}\equiv \mathrm {H} (X)-\mathrm {H} (X\mid Y)\\&{}\equiv \mathrm {H} (Y)-\mathrm {H} (Y\mid X)\\&{}\equiv \mathrm {H} (X)+\mathrm {H} (Y)-\mathrm {H} (X,Y)\\&{}\equiv \mathrm {H} (X,Y)-\mathrm {H} (X\mid Y)-\mathrm {H} (Y\mid X)\end{aligned}}}$ 

where ${\displaystyle \mathrm {H} (X)}$ and ${\displaystyle \mathrm {H} (Y)}$ are the marginal [entropies](https://en.wikipedia.org/wiki/Information_entropy "Information entropy"), ${\displaystyle \mathrm {H} (X\mid Y)}$ and ${\displaystyle \mathrm {H} (Y\mid X)}$ are the [conditional entropies](https://en.wikipedia.org/wiki/Conditional_entropy "Conditional entropy"), and ${\displaystyle \mathrm {H} (X,Y)}$ is the [joint entropy](https://en.wikipedia.org/wiki/Joint_entropy "Joint entropy") of ${\displaystyle X}$ and ${\displaystyle Y}$  .

Notice the analogy to the union, difference, and intersection of two sets: in this respect, all the formulas given above are apparent from the Venn diagram reported at the beginning of the article.

In terms of a communication channel in which the output ${\displaystyle Y}$ is a noisy version of the input ${\displaystyle X}$  , these relations are summarised in the figure:

![[Clippings/attachments/d3981a36bd0b8682b6b0b1394168e6c2_MD5.png]]

The relationships between information theoretic quantities

Because ${\displaystyle \operatorname {I} (X;Y)}$ is non-negative, consequently, ${\displaystyle \mathrm {H} (X)\geq \mathrm {H} (X\mid Y)}$  . Here we give the detailed deduction of ${\displaystyle \operatorname {I} (X;Y)=\mathrm {H} (Y)-\mathrm {H} (Y\mid X)}$ for the case of jointly discrete random variables:

${\displaystyle {\begin{aligned}\operatorname {I} (X;Y)&{}=\sum _{x\in {\mathcal {X}},y\in {\mathcal {Y}}}p_{(X,Y)}(x,y)\log {\frac {p_{(X,Y)}(x,y)}{p_{X}(x)p_{Y}(y)}}\\&{}=\sum _{x\in {\mathcal {X}},y\in {\mathcal {Y}}}p_{(X,Y)}(x,y)\log {\frac {p_{(X,Y)}(x,y)}{p_{X}(x)}}-\sum _{x\in {\mathcal {X}},y\in {\mathcal {Y}}}p_{(X,Y)}(x,y)\log p_{Y}(y)\\&{}=\sum _{x\in {\mathcal {X}},y\in {\mathcal {Y}}}p_{X}(x)p_{Y\mid X=x}(y)\log p_{Y\mid X=x}(y)-\sum _{x\in {\mathcal {X}},y\in {\mathcal {Y}}}p_{(X,Y)}(x,y)\log p_{Y}(y)\\&{}=\sum _{x\in {\mathcal {X}}}p_{X}(x)\left(\sum _{y\in {\mathcal {Y}}}p_{Y\mid X=x}(y)\log p_{Y\mid X=x}(y)\right)-\sum _{y\in {\mathcal {Y}}}\left(\sum _{x\in {\mathcal {X}}}p_{(X,Y)}(x,y)\right)\log p_{Y}(y)\\&{}=-\sum _{x\in {\mathcal {X}}}p_{X}(x)\mathrm {H} (Y\mid X=x)-\sum _{y\in {\mathcal {Y}}}p_{Y}(y)\log p_{Y}(y)\\&{}=-\mathrm {H} (Y\mid X)+\mathrm {H} (Y)\\&{}=\mathrm {H} (Y)-\mathrm {H} (Y\mid X).\\\end{aligned}}}$ 

The proofs of the other identities above are similar. The proof of the general case (not just discrete) is similar, with integrals replacing sums.

Intuitively, if entropy ${\displaystyle \mathrm {H} (Y)}$ is regarded as a measure of uncertainty about a random variable, then ${\displaystyle \mathrm {H} (Y\mid X)}$ is a measure of what ${\displaystyle X}$ does *not* say about ${\displaystyle Y}$  . This is "the amount of uncertainty remaining about ${\displaystyle Y}$ after ${\displaystyle X}$ is known", and thus the right side of the second of these equalities can be read as "the amount of uncertainty in ${\displaystyle Y}$  , minus the amount of uncertainty in ${\displaystyle Y}$ which remains after ${\displaystyle X}$ is known", which is equivalent to "the amount of uncertainty in ${\displaystyle Y}$ which is removed by knowing ${\displaystyle X}$  ". This corroborates the intuitive meaning of mutual information as the amount of information (that is, reduction in uncertainty) that knowing either variable provides about the other.

Note that in the discrete case ${\displaystyle \mathrm {H} (Y\mid Y)=0}$ and therefore ${\displaystyle \mathrm {H} (Y)=\operatorname {I} (Y;Y)}$  . Thus ${\displaystyle \operatorname {I} (Y;Y)\geq \operatorname {I} (X;Y)}$  , and one can formulate the basic principle that a variable contains at least as much information about itself as any other variable can provide.

### Relation to Kullback–Leibler divergence

For jointly discrete or jointly continuous pairs ${\displaystyle (X,Y)}$  , mutual information is the [Kullback–Leibler divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence "Kullback–Leibler divergence") from the product of the [marginal distributions](https://en.wikipedia.org/wiki/Marginal_distribution "Marginal distribution"), ${\displaystyle p_{X}\cdot p_{Y}}$  , of the [joint distribution](https://en.wikipedia.org/wiki/Joint_distribution "Joint distribution") ${\displaystyle p_{(X,Y)}}$  , that is,

${\displaystyle \operatorname {I} (X;Y)=D_{\text{KL}}\left(p_{(X,Y)}\parallel p_{X}p_{Y}\right)}$ 

Furthermore, let ${\displaystyle p_{(X,Y)}(x,y)=p_{X\mid Y=y}(x)*p_{Y}(y)}$ be the conditional mass or density function. Then, we have the identity

${\displaystyle \operatorname {I} (X;Y)=\mathbb {E} _{Y}\left[D_{\text{KL}}\!\left(p_{X\mid Y}\parallel p_{X}\right)\right]}$ 

The proof for jointly discrete random variables is as follows:

${\displaystyle {\begin{aligned}\operatorname {I} (X;Y)&=\sum _{y\in {\mathcal {Y}}}\sum _{x\in {\mathcal {X}}}{p_{(X,Y)}(x,y)\log \left({\frac {p_{(X,Y)}(x,y)}{p_{X}(x)\,p_{Y}(y)}}\right)}\\&=\sum _{y\in {\mathcal {Y}}}\sum _{x\in {\mathcal {X}}}p_{X\mid Y=y}(x)p_{Y}(y)\log {\frac {p_{X\mid Y=y}(x)p_{Y}(y)}{p_{X}(x)p_{Y}(y)}}\\&=\sum _{y\in {\mathcal {Y}}}p_{Y}(y)\sum _{x\in {\mathcal {X}}}p_{X\mid Y=y}(x)\log {\frac {p_{X\mid Y=y}(x)}{p_{X}(x)}}\\&=\sum _{y\in {\mathcal {Y}}}p_{Y}(y)\;D_{\text{KL}}\!\left(p_{X\mid Y=y}\parallel p_{X}\right)\\&=\mathbb {E} _{Y}\left[D_{\text{KL}}\!\left(p_{X\mid Y}\parallel p_{X}\right)\right].\end{aligned}}}$ 

Similarly this identity can be established for jointly continuous random variables.

Note that here the Kullback–Leibler divergence involves integration over the values of the random variable ${\displaystyle X}$ only, and the expression ${\displaystyle D_{\text{KL}}(p_{X\mid Y}\parallel p_{X})}$ still denotes a random variable because ${\displaystyle Y}$ is random. Thus mutual information can also be understood as the [expectation](https://en.wikipedia.org/wiki/Expected_value "Expected value") of the Kullback–Leibler divergence of the [univariate distribution](https://en.wikipedia.org/wiki/Univariate_distribution "Univariate distribution") ${\displaystyle p_{X}}$ of ${\displaystyle X}$ from the [conditional distribution](https://en.wikipedia.org/wiki/Conditional_distribution "Conditional distribution") ${\displaystyle p_{X\mid Y}}$ of ${\displaystyle X}$ given ${\displaystyle Y}$  : the more different the distributions ${\displaystyle p_{X\mid Y}}$ and ${\displaystyle p_{X}}$ are on average, the greater the [information gain](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence "Kullback–Leibler divergence").

### Bayesian estimation of mutual information

If samples from a joint distribution are available, a Bayesian approach can be used to estimate the mutual information of that distribution. The first work to do this, which also showed how to do Bayesian estimation of many other information-theoretic properties besides mutual information, was.[^5] Subsequent researchers have rederived [^6] and extended [^7] this analysis. See [^8] for a recent paper based on a prior specifically tailored to estimation of mutual information per se. Besides, recently an estimation method accounting for continuous and multivariate outputs, ${\displaystyle Y}$  , was proposed in .[^9]

### Independence assumptions

The Kullback-Leibler divergence formulation of the mutual information is predicated on that one is interested in comparing ${\displaystyle p(x,y)}$ to the fully factorized [outer product](https://en.wikipedia.org/wiki/Outer_product "Outer product") ${\displaystyle p(x)\cdot p(y)}$  . In many problems, such as [non-negative matrix factorization](https://en.wikipedia.org/wiki/Non-negative_matrix_factorization "Non-negative matrix factorization"), one is interested in less extreme factorizations; specifically, one wishes to compare ${\displaystyle p(x,y)}$ to a low-rank matrix approximation in some unknown variable ${\displaystyle w}$  ; that is, to what degree one might have

${\displaystyle p(x,y)\approx \sum _{w}p^{\prime }(x,w)p^{\prime \prime }(w,y)}$ 

Alternately, one might be interested in knowing how much more information ${\displaystyle p(x,y)}$ carries over its factorization. In such a case, the excess information that the full distribution ${\displaystyle p(x,y)}$ carries over the matrix factorization is given by the Kullback-Leibler divergence

${\displaystyle \operatorname {I} _{LRMA}=\sum _{y\in {\mathcal {Y}}}\sum _{x\in {\mathcal {X}}}{p(x,y)\log {\left({\frac {p(x,y)}{\sum _{w}p^{\prime }(x,w)p^{\prime \prime }(w,y)}}\right)}},}$ 

The conventional definition of the mutual information is recovered in the extreme case that the process ${\displaystyle W}$ has only one value for ${\displaystyle w}$  .

## Variations

Several variations on mutual information have been proposed to suit various needs. Among these are normalized variants and generalizations to more than two variables.

### Metric

Many applications require a [metric](https://en.wikipedia.org/wiki/Metric_\(mathematics\) "Metric (mathematics)"), that is, a distance measure between pairs of points. The quantity

${\displaystyle {\begin{aligned}d(X,Y)&=\mathrm {H} (X,Y)-\operatorname {I} (X;Y)\\&=\mathrm {H} (X)+\mathrm {H} (Y)-2\operatorname {I} (X;Y)\\&=\mathrm {H} (X\mid Y)+\mathrm {H} (Y\mid X)\\&=2\mathrm {H} (X,Y)-\mathrm {H} (X)-\mathrm {H} (Y)\end{aligned}}}$ 

satisfies the properties of a metric ([triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality "Triangle inequality"), [non-negativity](https://en.wikipedia.org/wiki/Non-negative "Non-negative"), [indiscernability](https://en.wikipedia.org/wiki/Identity_of_indiscernibles "Identity of indiscernibles") and symmetry), where equality ${\displaystyle X=Y}$ is understood to mean that ${\displaystyle X}$ can be completely determined from ${\displaystyle Y}$  .[^10]

This distance metric is also known as the [variation of information](https://en.wikipedia.org/wiki/Variation_of_information "Variation of information").

If ${\displaystyle X,Y}$ are discrete random variables then all the entropy terms are non-negative, so ${\displaystyle 0\leq d(X,Y)\leq \mathrm {H} (X,Y)}$ and one can define a normalized distance

${\displaystyle D(X,Y)={\frac {d(X,Y)}{\mathrm {H} (X,Y)}}\leq 1.}$ 

Plugging in the definitions shows that

${\displaystyle D(X,Y)=1-{\frac {\operatorname {I} (X;Y)}{\mathrm {H} (X,Y)}}.}$ 

This is known as the Rajski Distance.[^11] In a set-theoretic interpretation of information (see the figure for [Conditional entropy](https://en.wikipedia.org/wiki/Conditional_entropy "Conditional entropy")), this is effectively the [Jaccard distance](https://en.wikipedia.org/wiki/Jaccard_index "Jaccard index") between ${\displaystyle X}$ and ${\displaystyle Y}$  .

Finally,

${\displaystyle D^{\prime }(X,Y)=1-{\frac {\operatorname {I} (X;Y)}{\max \left\{\mathrm {H} (X),\mathrm {H} (Y)\right\}}}}$ 

is also a metric.

### Conditional mutual information

Main article: [Conditional mutual information](https://en.wikipedia.org/wiki/Conditional_mutual_information "Conditional mutual information")

Sometimes it is useful to express the mutual information of two random variables conditioned on a third.

${\displaystyle \operatorname {I} (X;Y|Z)=\mathbb {E} _{Z}[D_{\mathrm {KL} }(P_{(X,Y)|Z}\|P_{X|Z}\otimes P_{Y|Z})]}$ 

For jointly [discrete random variables](https://en.wikipedia.org/wiki/Discrete_random_variable "Discrete random variable") this takes the form

${\displaystyle \operatorname {I} (X;Y|Z)=\sum _{z\in {\mathcal {Z}}}\sum _{y\in {\mathcal {Y}}}\sum _{x\in {\mathcal {X}}}{p_{Z}(z)\,p_{X,Y|Z}(x,y|z)\log \left[{\frac {p_{X,Y|Z}(x,y|z)}{p_{X|Z}\,(x|z)p_{Y|Z}(y|z)}}\right]},}$ 

which can be simplified as

${\displaystyle \operatorname {I} (X;Y|Z)=\sum _{z\in {\mathcal {Z}}}\sum _{y\in {\mathcal {Y}}}\sum _{x\in {\mathcal {X}}}p_{X,Y,Z}(x,y,z)\log {\frac {p_{X,Y,Z}(x,y,z)p_{Z}(z)}{p_{X,Z}(x,z)p_{Y,Z}(y,z)}}.}$ 

For jointly [continuous random variables](https://en.wikipedia.org/wiki/Continuous_random_variable "Continuous random variable") this takes the form

${\displaystyle \operatorname {I} (X;Y|Z)=\int _{\mathcal {Z}}\int _{\mathcal {Y}}\int _{\mathcal {X}}{p_{Z}(z)\,p_{X,Y|Z}(x,y|z)\log \left[{\frac {p_{X,Y|Z}(x,y|z)}{p_{X|Z}\,(x|z)p_{Y|Z}(y|z)}}\right]}dxdydz,}$ 

which can be simplified as

${\displaystyle \operatorname {I} (X;Y|Z)=\int _{\mathcal {Z}}\int _{\mathcal {Y}}\int _{\mathcal {X}}p_{X,Y,Z}(x,y,z)\log {\frac {p_{X,Y,Z}(x,y,z)p_{Z}(z)}{p_{X,Z}(x,z)p_{Y,Z}(y,z)}}dxdydz.}$ 

Conditioning on a third random variable may either increase or decrease the mutual information, but it is always true that

${\displaystyle \operatorname {I} (X;Y|Z)\geq 0}$ 

for discrete, jointly distributed random variables ${\displaystyle X,Y,Z}$  . This result has been used as a basic building block for proving other [inequalities in information theory](https://en.wikipedia.org/wiki/Inequalities_in_information_theory "Inequalities in information theory").

### Interaction information

Main article: [Interaction information](https://en.wikipedia.org/wiki/Interaction_information "Interaction information")

Several generalizations of mutual information to more than two random variables have been proposed, such as [total correlation](https://en.wikipedia.org/wiki/Total_correlation "Total correlation") (or multi-information) and [dual total correlation](https://en.wikipedia.org/wiki/Dual_total_correlation "Dual total correlation"). The expression and study of multivariate higher-degree mutual information was achieved in two seemingly independent works: McGill (1954)[^12] who called these functions "interaction information", and Hu Kuo Ting (1962).[^on_the_amount_of_information-13] Interaction information is defined for one variable as follows:

${\displaystyle \operatorname {I} (X_{1})=\mathrm {H} (X_{1})}$ 

and for ${\displaystyle n>1,}$ 

${\displaystyle \operatorname {I} (X_{1};\,...\,;X_{n})=\operatorname {I} (X_{1};\,...\,;X_{n-1})-\operatorname {I} (X_{1};\,...\,;X_{n-1}\mid X_{n}).}$ 

Some authors reverse the order of the terms on the right-hand side of the preceding equation, which changes the sign when the number of random variables is odd. (And in this case, the single-variable expression becomes the negative of the entropy.) Note that

${\displaystyle I(X_{1};\ldots ;X_{n-1}\mid X_{n})=\mathbb {E} _{X_{n}}[D_{\mathrm {KL} }(P_{(X_{1},\ldots ,X_{n-1})\mid X_{n}}\|P_{X_{1}\mid X_{n}}\otimes \cdots \otimes P_{X_{n-1}\mid X_{n}})].}$ 

#### Multivariate statistical independence

The multivariate mutual information functions generalize the pairwise independence case that states that ${\displaystyle X_{1},X_{2}}$ if and only if ${\displaystyle I(X_{1};X_{2})=0}$  , to arbitrary numerous variable. n variables are mutually independent if and only if the ${\displaystyle 2^{n}-n-1}$ mutual information functions vanish ${\displaystyle I(X_{1};\ldots ;X_{k})=0}$ with ${\displaystyle n\geq k\geq 2}$ (theorem 2[^e21090869-14]). In this sense, the ${\displaystyle I(X_{1};\ldots ;X_{k})=0}$ can be used as a refined statistical independence criterion.

#### Applications

For 3 variables, Brenner et al. applied multivariate mutual information to neural coding and called its negativity "synergy"[^15] and Watkinson et al. applied it to genetic expression.[^16] For arbitrary k variables, Tapia et al. applied multivariate mutual information to gene expression.[^s41598-17][^e21090869-14] It can be zero, positive, or negative.[^on_the_amount_of_information-13] The positivity corresponds to relations generalizing the pairwise correlations, nullity corresponds to a refined notion of independence, and negativity detects high dimensional "emergent" relations and clusterized datapoints [^s41598-17]).

One high-dimensional generalization scheme which maximizes the mutual information between the joint distribution and other target variables is found to be useful in [feature selection](https://en.wikipedia.org/wiki/Feature_selection "Feature selection").[^18]

Mutual information is also used in the area of signal processing as a [measure of similarity](https://en.wikipedia.org/wiki/Similarity_measure "Similarity measure") between two signals. For example, FMI metric[^19] is an image fusion performance measure that makes use of mutual information in order to measure the amount of information that the fused image contains about the source images. The [Matlab](https://en.wikipedia.org/wiki/Matlab "Matlab") code for this metric can be found at.[^20] A python package for computing all multivariate mutual informations, conditional mutual information, joint entropies, total correlations, information distance in a dataset of n variables is available.[^21]

### Directed information

[Directed information](https://en.wikipedia.org/wiki/Directed_information "Directed information"), ${\displaystyle \operatorname {I} \left(X^{n}\to Y^{n}\right)}$  , measures the amount of information that flows from the process ${\displaystyle X^{n}}$ to ${\displaystyle Y^{n}}$  , where ${\displaystyle X^{n}}$ denotes the vector ${\displaystyle X_{1},X_{2},...,X_{n}}$ and ${\displaystyle Y^{n}}$ denotes ${\displaystyle Y_{1},Y_{2},...,Y_{n}}$  . The term *directed information* was coined by [James Massey](https://en.wikipedia.org/wiki/James_Massey "James Massey") and is defined as

${\displaystyle \operatorname {I} \left(X^{n}\to Y^{n}\right)=\sum _{i=1}^{n}\operatorname {I} \left(X^{i};Y_{i}\mid Y^{i-1}\right)}$  .

Note that if ${\displaystyle n=1}$  , the directed information becomes the mutual information. Directed information has many applications in problems where [causality](https://en.wikipedia.org/wiki/Causality "Causality") plays an important role, such as [capacity of channel](https://en.wikipedia.org/wiki/Channel_capacity "Channel capacity") with feedback.[^22][^23]

### Normalized variants

Normalized variants of the mutual information are provided by the *coefficients of constraint*,[^footnotecoombsdawestversky1970-24] [uncertainty coefficient](https://en.wikipedia.org/wiki/Uncertainty_coefficient "Uncertainty coefficient")[^pressflannery-25] or proficiency:[^jimwhite-26]

${\displaystyle C_{XY}={\frac {\operatorname {I} (X;Y)}{\mathrm {H} (Y)}}~~~~{\mbox{and}}~~~~C_{YX}={\frac {\operatorname {I} (X;Y)}{\mathrm {H} (X)}}.}$ 

The two coefficients have a value ranging in \[0, 1\], but are not necessarily equal. This measure is not symmetric. If one desires a symmetric measure they can consider the following *[redundancy](https://en.wikipedia.org/wiki/Redundancy_\(information_theory\) "Redundancy (information theory)")* measure:

${\displaystyle R={\frac {\operatorname {I} (X;Y)}{\mathrm {H} (X)+\mathrm {H} (Y)}}}$ 

which attains a minimum of zero when the variables are independent and a maximum value of

${\displaystyle R_{\max }={\frac {\min \left\{\mathrm {H} (X),\mathrm {H} (Y)\right\}}{\mathrm {H} (X)+\mathrm {H} (Y)}}}$ 

when one variable becomes completely redundant with the knowledge of the other. See also *[Redundancy (information theory)](https://en.wikipedia.org/wiki/Redundancy_\(information_theory\) "Redundancy (information theory)")*.

Another symmetrical measure is the *symmetric uncertainty* ([Witten & Frank 2005](https://en.wikipedia.org/wiki/#CITEREFWittenFrank2005)), given by

${\displaystyle U(X,Y)=2R=2{\frac {\operatorname {I} (X;Y)}{\mathrm {H} (X)+\mathrm {H} (Y)}}}$ 

which represents the [harmonic mean](https://en.wikipedia.org/wiki/Harmonic_mean "Harmonic mean") of the two uncertainty coefficients ${\displaystyle C_{XY},C_{YX}}$  .[^pressflannery-25]

If we consider mutual information as a special case of the [total correlation](https://en.wikipedia.org/wiki/Total_correlation "Total correlation") or [dual total correlation](https://en.wikipedia.org/wiki/Dual_total_correlation "Dual total correlation"), the normalized version are respectively,

${\displaystyle {\frac {\operatorname {I} (X;Y)}{\min \left[\mathrm {H} (X),\mathrm {H} (Y)\right]}}}$ and ${\displaystyle {\frac {\operatorname {I} (X;Y)}{\mathrm {H} (X,Y)}}\;.}$ 

This normalized version also known as **Information Quality Ratio (IQR)** which quantifies the amount of information of a variable based on another variable against total uncertainty:[^drwijaya-27]

${\displaystyle IQR(X,Y)=\operatorname {E} [\operatorname {I} (X;Y)]={\frac {\operatorname {I} (X;Y)}{\mathrm {H} (X,Y)}}={\frac {\sum _{x\in X}\sum _{y\in Y}p(x,y)\log {p(x)p(y)}}{\sum _{x\in X}\sum _{y\in Y}p(x,y)\log {p(x,y)}}}-1}$ 

There's a normalization[^strehl-jmlr02-28] which derives from first thinking of mutual information as an analogue to [covariance](https://en.wikipedia.org/wiki/Covariance "Covariance") (thus [Shannon entropy](https://en.wikipedia.org/wiki/Entropy_\(information_theory\) "Entropy (information theory)") is analogous to [variance](https://en.wikipedia.org/wiki/Variance "Variance")). Then the normalized mutual information is calculated akin to the [Pearson correlation coefficient](https://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient "Pearson product-moment correlation coefficient"),

${\displaystyle {\frac {\operatorname {I} (X;Y)}{\sqrt {\mathrm {H} (X)\mathrm {H} (Y)}}}\;.}$ 

### Weighted variants

In the traditional formulation of the mutual information,

${\displaystyle \operatorname {I} (X;Y)=\sum _{y\in Y}\sum _{x\in X}p(x,y)\log {\frac {p(x,y)}{p(x)\,p(y)}},}$ 

each *event* or *object* specified by ${\displaystyle (x,y)}$ is weighted by the corresponding probability ${\displaystyle p(x,y)}$  . This assumes that all objects or events are equivalent *apart from* their probability of occurrence. However, in some applications it may be the case that certain objects or events are more *significant* than others, or that certain patterns of association are more semantically important than others.

For example, the deterministic mapping ${\displaystyle \{(1,1),(2,2),(3,3)\}}$ may be viewed as stronger than the deterministic mapping ${\displaystyle \{(1,3),(2,1),(3,2)\}}$  , although these relationships would yield the same mutual information. This is because the mutual information is not sensitive at all to any inherent ordering in the variable values ([Cronbach 1954](https://en.wikipedia.org/wiki/#CITEREFCronbach1954), [Coombs, Dawes & Tversky 1970](https://en.wikipedia.org/wiki/#CITEREFCoombsDawesTversky1970), [Lockhead 1970](https://en.wikipedia.org/wiki/#CITEREFLockhead1970)), and is therefore not sensitive at all to the **form** of the relational mapping between the associated variables. If it is desired that the former relation—showing agreement on all variable values—be judged stronger than the later relation, then it is possible to use the following *weighted mutual information* ([Guiasu 1977](https://en.wikipedia.org/wiki/#CITEREFGuiasu1977)).

${\displaystyle \operatorname {I} (X;Y)=\sum _{y\in Y}\sum _{x\in X}w(x,y)p(x,y)\log {\frac {p(x,y)}{p(x)\,p(y)}},}$ 

which places a weight ${\displaystyle w(x,y)}$ on the probability of each variable value co-occurrence, ${\displaystyle p(x,y)}$  . This allows that certain probabilities may carry more or less significance than others, thereby allowing the quantification of relevant *holistic* or *[Prägnanz](https://en.wikipedia.org/wiki/Pr%C3%A4gnanz "Prägnanz")* factors. In the above example, using larger relative weights for ${\displaystyle w(1,1)}$  , ${\displaystyle w(2,2)}$  , and ${\displaystyle w(3,3)}$ would have the effect of assessing greater *informativeness* for the relation ${\displaystyle \{(1,1),(2,2),(3,3)\}}$ than for the relation ${\displaystyle \{(1,3),(2,1),(3,2)\}}$  , which may be desirable in some cases of pattern recognition, and the like. This weighted mutual information is a form of weighted KL-Divergence, which is known to take negative values for some inputs,[^weighted-kl-29] and there are examples where the weighted mutual information also takes negative values.[^30]

### Adjusted mutual information

Main article: [adjusted mutual information](https://en.wikipedia.org/wiki/Adjusted_mutual_information "Adjusted mutual information")

A probability distribution can be viewed as a [partition of a set](https://en.wikipedia.org/wiki/Partition_of_a_set "Partition of a set"). One may then ask: if a set were partitioned randomly, what would the distribution of probabilities be? What would the expectation value of the mutual information be? The [adjusted mutual information](https://en.wikipedia.org/wiki/Adjusted_mutual_information "Adjusted mutual information") or AMI subtracts the expectation value of the MI, so that the AMI is zero when two different distributions are random, and one when two distributions are identical. The AMI is defined in analogy to the [adjusted Rand index](https://en.wikipedia.org/wiki/Adjusted_Rand_index "Adjusted Rand index") of two different partitions of a set.

### Absolute mutual information

Using the ideas of [Kolmogorov complexity](https://en.wikipedia.org/wiki/Kolmogorov_complexity "Kolmogorov complexity"), one can consider the mutual information of two sequences independent of any probability distribution:

${\displaystyle \operatorname {I} _{K}(X;Y)=K(X)-K(X\mid Y).}$ 

To establish that this quantity is symmetric up to a logarithmic factor (  ${\displaystyle \operatorname {I} _{K}(X;Y)\approx \operatorname {I} _{K}(Y;X)}$  ) one requires the [chain rule for Kolmogorov complexity](https://en.wikipedia.org/wiki/Chain_rule_for_Kolmogorov_complexity "Chain rule for Kolmogorov complexity") ([Li & Vitányi 1997](https://en.wikipedia.org/wiki/#CITEREFLiVit%C3%A1nyi1997)). Approximations of this quantity via [compression](https://en.wikipedia.org/wiki/Data_compression "Data compression") can be used to define a [distance measure](https://en.wikipedia.org/wiki/Metric_\(mathematics\) "Metric (mathematics)") to perform a [hierarchical clustering](https://en.wikipedia.org/wiki/Hierarchical_clustering "Hierarchical clustering") of sequences without having any [domain knowledge](https://en.wikipedia.org/wiki/Domain_knowledge "Domain knowledge") of the sequences ([Cilibrasi & Vitányi 2005](https://en.wikipedia.org/wiki/#CITEREFCilibrasiVit%C3%A1nyi2005)).

### Linear correlation

Unlike correlation coefficients, such as the [product moment correlation coefficient](https://en.wikipedia.org/wiki/Product_moment_correlation_coefficient "Product moment correlation coefficient"), mutual information contains information about all dependence—linear and nonlinear—and not just linear dependence as the correlation coefficient measures. However, in the narrow case that the joint distribution for ${\displaystyle X}$ and ${\displaystyle Y}$ is a [bivariate normal distribution](https://en.wikipedia.org/wiki/Bivariate_normal_distribution "Bivariate normal distribution") (implying in particular that both marginal distributions are normally distributed), there is an exact relationship between ${\displaystyle \operatorname {I} }$ and the correlation coefficient ${\displaystyle \rho }$ ([Gel'fand & Yaglom 1957](https://en.wikipedia.org/wiki/#CITEREFGel'fandYaglom1957)).

${\displaystyle \operatorname {I} =-{\frac {1}{2}}\log \left(1-\rho ^{2}\right)}$ 

The equation above can be derived as follows for a bivariate Gaussian:

${\displaystyle {\begin{aligned}{\begin{pmatrix}X_{1}\\X_{2}\end{pmatrix}}&\sim {\mathcal {N}}\left({\begin{pmatrix}\mu _{1}\\\mu _{2}\end{pmatrix}},\Sigma \right),\qquad \Sigma ={\begin{pmatrix}\sigma _{1}^{2}&\rho \sigma _{1}\sigma _{2}\\\rho \sigma _{1}\sigma _{2}&\sigma _{2}^{2}\end{pmatrix}}\\\mathrm {H} (X_{i})&={\frac {1}{2}}\log \left(2\pi e\sigma _{i}^{2}\right)={\frac {1}{2}}+{\frac {1}{2}}\log(2\pi )+\log \left(\sigma _{i}\right),\quad i\in \{1,2\}\\\mathrm {H} (X_{1},X_{2})&={\frac {1}{2}}\log \left[(2\pi e)^{2}|\Sigma |\right]=1+\log(2\pi )+\log \left(\sigma _{1}\sigma _{2}\right)+{\frac {1}{2}}\log \left(1-\rho ^{2}\right)\\\end{aligned}}}$ 

Therefore,

${\displaystyle \operatorname {I} \left(X_{1};X_{2}\right)=\mathrm {H} \left(X_{1}\right)+\mathrm {H} \left(X_{2}\right)-\mathrm {H} \left(X_{1},X_{2}\right)=-{\frac {1}{2}}\log \left(1-\rho ^{2}\right)}$ 

### For discrete data

When ${\displaystyle X}$ and ${\displaystyle Y}$ are limited to be in a discrete number of states, observation data is summarized in a [contingency table](https://en.wikipedia.org/wiki/Contingency_table "Contingency table"), with row variable ${\displaystyle X}$ (or ${\displaystyle i}$  ) and column variable ${\displaystyle Y}$ (or ${\displaystyle j}$  ). Mutual information is one of the measures of [association](https://en.wikipedia.org/wiki/Association_\(statistics\) "Association (statistics)") or [correlation](https://en.wikipedia.org/wiki/Correlation_and_dependence "Correlation and dependence") between the row and column variables.

Other measures of association include [Pearson's chi-squared test](https://en.wikipedia.org/wiki/Pearson%27s_chi-squared_test "Pearson's chi-squared test") statistics, [G-test](https://en.wikipedia.org/wiki/G-test "G-test") statistics, etc. In fact, with the same log base, mutual information will be equal to the [G-test](https://en.wikipedia.org/wiki/G-test "G-test") log-likelihood statistic divided by ${\displaystyle 2N}$  , where ${\displaystyle N}$ is the sample size.

## Applications

In many applications, one wants to maximize mutual information (thus increasing dependencies), which is often equivalent to minimizing [conditional entropy](https://en.wikipedia.org/wiki/Conditional_entropy "Conditional entropy"). Examples include:

- In [search engine technology](https://en.wikipedia.org/wiki/Search_engine_technology "Search engine technology"), mutual information between phrases and contexts is used as a feature for [k-means clustering](https://en.wikipedia.org/wiki/K-means_clustering "K-means clustering") to discover semantic clusters (concepts).[^magerman-31] For example, the mutual information of a bigram might be calculated as:

${\displaystyle MI(x,y)=\log {\frac {P_{X,Y}(x,y)}{P_{X}(x)P_{Y}(y)}}\approx \log {\frac {\frac {f_{XY}}{B}}{{\frac {f_{X}}{U}}{\frac {f_{Y}}{U}}}}}$ 

where ${\displaystyle f_{XY}}$ is the number of times the bigram xy appears in the corpus, ${\displaystyle f_{X}}$ is the number of times the unigram x appears in the corpus, B is the total number of bigrams, and U is the total number of unigrams.[^magerman-31]

- In [telecommunications](https://en.wikipedia.org/wiki/Telecommunications "Telecommunications"), the [channel capacity](https://en.wikipedia.org/wiki/Channel_capacity "Channel capacity") is equal to the mutual information, maximized over all input distributions.
- [Discriminative training](https://en.wikipedia.org/wiki/Discriminative_model "Discriminative model") procedures for [hidden Markov models](https://en.wikipedia.org/wiki/Hidden_Markov_model "Hidden Markov model") have been proposed based on the [maximum mutual information](https://en.wikipedia.org/w/index.php?title=Maximum_mutual_information&action=edit&redlink=1 "Maximum mutual information (page does not exist)") (MMI) criterion.
- [RNA secondary structure](https://en.wikipedia.org/wiki/Nucleic_acid_secondary_structure "Nucleic acid secondary structure") prediction from a [multiple sequence alignment](https://en.wikipedia.org/wiki/Multiple_sequence_alignment "Multiple sequence alignment").
- [Phylogenetic profiling](https://en.wikipedia.org/wiki/Phylogenetic_profiling "Phylogenetic profiling") prediction from pairwise present and disappearance of functionally link [genes](https://en.wikipedia.org/wiki/Gene "Gene").
- Mutual information has been used as a criterion for [feature selection](https://en.wikipedia.org/wiki/Feature_selection "Feature selection") and feature transformations in [machine learning](https://en.wikipedia.org/wiki/Machine_learning "Machine learning"). It can be used to characterize both the relevance and redundancy of variables, such as the [minimum redundancy feature selection](https://en.wikipedia.org/wiki/Minimum_redundancy_feature_selection "Minimum redundancy feature selection").
- Mutual information is used in determining the similarity of two different [clusterings](https://en.wikipedia.org/wiki/Cluster_analysis "Cluster analysis") of a dataset. As such, it provides some advantages over the traditional [Rand index](https://en.wikipedia.org/wiki/Rand_index "Rand index").
- Mutual information of words is often used as a significance function for the computation of [collocations](https://en.wikipedia.org/wiki/Collocation "Collocation") in [corpus linguistics](https://en.wikipedia.org/wiki/Corpus_linguistics "Corpus linguistics"). This has the added complexity that no word-instance is an instance to two different words; rather, one counts instances where 2 words occur adjacent or in close proximity; this slightly complicates the calculation, since the expected probability of one word occurring within ${\displaystyle N}$ words of another, goes up with ${\displaystyle N}$
- Mutual information is used in [medical imaging](https://en.wikipedia.org/wiki/Medical_imaging "Medical imaging") for [image registration](https://en.wikipedia.org/wiki/Image_registration "Image registration"). Given a reference image (for example, a brain scan), and a second image which needs to be put into the same [coordinate system](https://en.wikipedia.org/wiki/Coordinate_system "Coordinate system") as the reference image, this image is deformed until the mutual information between it and the reference image is maximized.
- Detection of [phase synchronization](https://en.wikipedia.org/wiki/Phase_synchronization "Phase synchronization") in [time series](https://en.wikipedia.org/wiki/Time_series "Time series") analysis.
- In the [infomax](https://en.wikipedia.org/wiki/Infomax "Infomax") method for neural-net and other machine learning, including the infomax-based [Independent component analysis](https://en.wikipedia.org/wiki/Independent_component_analysis "Independent component analysis") algorithm
- Average mutual information in [delay embedding theorem](https://en.wikipedia.org/wiki/Delay_embedding_theorem "Delay embedding theorem") is used for determining the *embedding delay* parameter.
- Mutual information between [genes](https://en.wikipedia.org/wiki/Genes "Genes") in [expression microarray](https://en.wikipedia.org/wiki/Microarray "Microarray") data is used by the ARACNE algorithm for reconstruction of [gene networks](https://en.wikipedia.org/wiki/Gene_regulatory_network "Gene regulatory network").
- In [statistical mechanics](https://en.wikipedia.org/wiki/Statistical_mechanics "Statistical mechanics"), [Loschmidt's paradox](https://en.wikipedia.org/wiki/Loschmidt%27s_paradox "Loschmidt's paradox") may be expressed in terms of mutual information.[^everett56-32][^everett57-33] Loschmidt noted that it must be impossible to determine a physical law which lacks [time reversal symmetry](https://en.wikipedia.org/wiki/Time_reversal_symmetry "Time reversal symmetry") (e.g. the [second law of thermodynamics](https://en.wikipedia.org/wiki/Second_law_of_thermodynamics "Second law of thermodynamics")) only from physical laws which have this symmetry. He pointed out that the [H-theorem](https://en.wikipedia.org/wiki/H-theorem "H-theorem") of [Boltzmann](https://en.wikipedia.org/wiki/Boltzmann "Boltzmann") made the assumption that the velocities of particles in a gas were permanently uncorrelated, which removed the time symmetry inherent in the H-theorem. It can be shown that if a system is described by a probability density in [phase space](https://en.wikipedia.org/wiki/Phase_space "Phase space"), then [Liouville's theorem](https://en.wikipedia.org/wiki/Liouville%27s_theorem_\(Hamiltonian\) "Liouville's theorem (Hamiltonian)") implies that the joint information (negative of the joint entropy) of the distribution remains constant in time. The joint information is equal to the mutual information plus the sum of all the marginal information (negative of the marginal entropies) for each particle coordinate. Boltzmann's assumption amounts to ignoring the mutual information in the calculation of entropy, which yields the thermodynamic entropy (divided by the Boltzmann constant).
- In [stochastic processes](https://en.wikipedia.org/wiki/Stochastic_process "Stochastic process") coupled to changing environments, mutual information can be used to disentangle internal and effective environmental dependencies.[^34][^35] This is particularly useful when a physical system undergoes changes in the parameters describing its dynamics, e.g., changes in temperature.
- The mutual information is used to learn the structure of [Bayesian networks](https://en.wikipedia.org/wiki/Bayesian_network "Bayesian network")/[dynamic Bayesian networks](https://en.wikipedia.org/wiki/Dynamic_Bayesian_network "Dynamic Bayesian network"), which is thought to explain the causal relationship between random variables, as exemplified by the GlobalMIT toolkit:[^36] learning the globally optimal dynamic Bayesian network with the Mutual Information Test criterion.
- The mutual information is used to quantify information transmitted during the updating procedure in the [Gibbs sampling](https://en.wikipedia.org/wiki/Gibbs_sampling "Gibbs sampling") algorithm.[^37]
- Popular cost function in [decision tree learning](https://en.wikipedia.org/wiki/Decision_tree_learning "Decision tree learning").
- The mutual information is used in [cosmology](https://en.wikipedia.org/wiki/Cosmology "Cosmology") to test the influence of large-scale environments on galaxy properties in the [Galaxy Zoo](https://en.wikipedia.org/wiki/Galaxy_Zoo "Galaxy Zoo").
- The mutual information was used in [Solar Physics](https://en.wikipedia.org/wiki/Solar_Physics "Solar Physics") to derive the solar [differential rotation](https://en.wikipedia.org/wiki/Differential_rotation "Differential rotation") profile, a travel-time deviation map for sunspots, and a time–distance diagram from quiet-Sun measurements[^38]
- Used in Invariant Information Clustering to automatically train neural network classifiers and image segmenters given no labelled data.[^iic-39]
- In [stochastic dynamical systems with multiple timescales](https://en.wikipedia.org/wiki/Multiscale_modeling "Multiscale modeling"), mutual information has been shown to capture the functional couplings between different temporal scales.[^40] Importantly, it was shown that physical interactions may or may not give rise to mutual information, depending on the typical timescale of their dynamics.

## See also

- [Data differencing](https://en.wikipedia.org/wiki/Data_differencing "Data differencing")
- [Pointwise mutual information](https://en.wikipedia.org/wiki/Pointwise_mutual_information "Pointwise mutual information")
- [Quantum mutual information](https://en.wikipedia.org/wiki/Quantum_mutual_information "Quantum mutual information")
- [Specific-information](https://en.wikipedia.org/wiki/Specific-information "Specific-information")

## Notes

[^1]: Cover, Thomas M.; Thomas, Joy A. (2005). [*Elements of information theory*](http://www.cs.columbia.edu/~vh/courses/LexicalSemantics/Association/Cover&Thomas-Ch2.pdf) (PDF). John Wiley & Sons, Ltd. pp. 13–55\. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [9780471748823](https://en.wikipedia.org/wiki/Special:BookSources/9780471748823 "Special:BookSources/9780471748823").

[^2]: Kreer, J. G. (1957). "A question of terminology". *IRE Transactions on Information Theory*. **3** (3): 208. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1109/TIT.1957.1057418](https://doi.org/10.1109%2FTIT.1957.1057418).

[^cover1991-3]: Cover, T.M.; Thomas, J.A. (1991). [*Elements of Information Theory*](https://archive.org/details/elementsofinform0000cove) (Wiley ed.). John Wiley & Sons. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-471-24195-9](https://en.wikipedia.org/wiki/Special:BookSources/978-0-471-24195-9 "Special:BookSources/978-0-471-24195-9").

[^4]: Janssen, Joseph; Guan, Vincent; Robeva, Elina (2023). ["Ultra-marginal Feature Importance: Learning from Data with Causal Guarantees"](https://proceedings.mlr.press/v206/janssen23a.html). *International Conference on Artificial Intelligence and Statistics*: 10782–10814\. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[2204.09938](https://arxiv.org/abs/2204.09938).

[^5]: Wolpert, D.H.; Wolf, D.R. (1995). "Estimating functions of probability distributions from a finite set of samples". *Physical Review E*. **52** (6): 6841–6854\. [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[1995PhRvE..52.6841W](https://ui.adsabs.harvard.edu/abs/1995PhRvE..52.6841W). [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.55.7122](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.55.7122). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1103/PhysRevE.52.6841](https://doi.org/10.1103%2FPhysRevE.52.6841). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [9964199](https://pubmed.ncbi.nlm.nih.gov/9964199). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [9795679](https://api.semanticscholar.org/CorpusID:9795679).

[^6]: Hutter, M. (2001). "Distribution of Mutual Information". *Advances in Neural Information Processing Systems*.

[^7]: Archer, E.; Park, I.M.; Pillow, J. (2013). ["Bayesian and Quasi-Bayesian Estimators for Mutual Information from Discrete Data"](https://doi.org/10.3390%2Fe15051738). *Entropy*. **15** (12): 1738–1755\. [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2013Entrp..15.1738A](https://ui.adsabs.harvard.edu/abs/2013Entrp..15.1738A). [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.294.4690](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.294.4690). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.3390/e15051738](https://doi.org/10.3390%2Fe15051738).

[^8]: Wolpert, D.H; DeDeo, S. (2013). ["Estimating Functions of Distributions Defined over Spaces of Unknown Size"](https://doi.org/10.3390%2Fe15114668). *Entropy*. **15** (12): 4668–4699\. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[1311.4548](https://arxiv.org/abs/1311.4548). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2013Entrp..15.4668W](https://ui.adsabs.harvard.edu/abs/2013Entrp..15.4668W). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.3390/e15114668](https://doi.org/10.3390%2Fe15114668). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [2737117](https://api.semanticscholar.org/CorpusID:2737117).

[^9]: Tomasz Jetka; Karol Nienaltowski; Tomasz Winarski; Slawomir Blonski; Michal Komorowski (2019). "Information-theoretic analysis of multivariate single-cell signaling responses". *[PLOS Computational Biology](https://en.wikipedia.org/wiki/PLOS_Computational_Biology "PLOS Computational Biology")*. **15** (7): e1007132. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[1808.05581](https://arxiv.org/abs/1808.05581). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2019PLSCB..15E7132J](https://ui.adsabs.harvard.edu/abs/2019PLSCB..15E7132J). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1371/journal.pcbi.1007132](https://doi.org/10.1371%2Fjournal.pcbi.1007132). [PMC](https://en.wikipedia.org/wiki/PMC_\(identifier\) "PMC (identifier)") [6655862](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6655862). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [31299056](https://pubmed.ncbi.nlm.nih.gov/31299056).

[^10]: Rajski, C. (1961). "A metric space of discrete probability distributions". *Information and Control*. **4** (4): 371–377\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1016/S0019-9958(61)80055-7](https://doi.org/10.1016%2FS0019-9958%2861%2980055-7).

[^11]: Rajski, C. (1961). "A metric space of discrete probability distributions". *Information and Control*. **4** (4): 371–377\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1016/S0019-9958(61)80055-7](https://doi.org/10.1016%2FS0019-9958%2861%2980055-7).

[^12]: McGill, W. (1954). "Multivariate information transmission". *Psychometrika*. **19** (1): 97–116\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1007/BF02289159](https://doi.org/10.1007%2FBF02289159). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [126431489](https://api.semanticscholar.org/CorpusID:126431489).

[^on_the_amount_of_information-13]: Hu, K.T. (1962). "On the Amount of Information". *Theory Probab. Appl*. **7** (4): 439–447\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1137/1107041](https://doi.org/10.1137%2F1107041).

[^e21090869-14]: Baudot, P.; Tapia, M.; Bennequin, D.; Goaillard, J.M. (2019). ["Topological Information Data Analysis"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7515398). *Entropy*. **21** (9). 869. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[1907.04242](https://arxiv.org/abs/1907.04242). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2019Entrp..21..869B](https://ui.adsabs.harvard.edu/abs/2019Entrp..21..869B). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.3390/e21090869](https://doi.org/10.3390%2Fe21090869). [PMC](https://en.wikipedia.org/wiki/PMC_\(identifier\) "PMC (identifier)") [7515398](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7515398). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [195848308](https://api.semanticscholar.org/CorpusID:195848308).

[^15]: Brenner, N.; Strong, S.; Koberle, R.; Bialek, W. (2000). "Synergy in a Neural Code". *Neural Comput*. **12** (7): 1531–1552\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1162/089976600300015259](https://doi.org/10.1162%2F089976600300015259). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [10935917](https://pubmed.ncbi.nlm.nih.gov/10935917). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [600528](https://api.semanticscholar.org/CorpusID:600528).

[^16]: Watkinson, J.; Liang, K.; Wang, X.; Zheng, T.; Anastassiou, D. (2009). "Inference of Regulatory Gene Interactions from Expression Data Using Three-Way Mutual Information". *Chall. Syst. Biol. Ann. N. Y. Acad. Sci*. **1158** (1): 302–313\. [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2009NYASA1158..302W](https://ui.adsabs.harvard.edu/abs/2009NYASA1158..302W). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1111/j.1749-6632.2008.03757.x](https://doi.org/10.1111%2Fj.1749-6632.2008.03757.x). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [19348651](https://pubmed.ncbi.nlm.nih.gov/19348651). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [8846229](https://api.semanticscholar.org/CorpusID:8846229).

[^s41598-17]: Tapia, M.; Baudot, P.; Formizano-Treziny, C.; Dufour, M.; Goaillard, J.M. (2018). ["Neurotransmitter identity and electrophysiological phenotype are genetically coupled in midbrain dopaminergic neurons"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6134142). *Sci. Rep*. **8** (1): 13637. [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2018NatSR...813637T](https://ui.adsabs.harvard.edu/abs/2018NatSR...813637T). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1038/s41598-018-31765-z](https://doi.org/10.1038%2Fs41598-018-31765-z). [PMC](https://en.wikipedia.org/wiki/PMC_\(identifier\) "PMC (identifier)") [6134142](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6134142). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [30206240](https://pubmed.ncbi.nlm.nih.gov/30206240).

[^18]: Christopher D. Manning; Prabhakar Raghavan; Hinrich Schütze (2008). *An Introduction to Information Retrieval*. [Cambridge University Press](https://en.wikipedia.org/wiki/Cambridge_University_Press "Cambridge University Press"). [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-521-86571-5](https://en.wikipedia.org/wiki/Special:BookSources/978-0-521-86571-5 "Special:BookSources/978-0-521-86571-5").

[^19]: Haghighat, M. B. A.; Aghagolzadeh, A.; Seyedarabi, H. (2011). "A non-reference image fusion metric based on mutual information of image features". *Computers & Electrical Engineering*. **37** (5): 744–756\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1016/j.compeleceng.2011.07.012](https://doi.org/10.1016%2Fj.compeleceng.2011.07.012). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [7738541](https://api.semanticscholar.org/CorpusID:7738541).

[^20]: ["Feature Mutual Information (FMI) metric for non-reference image fusion - File Exchange - MATLAB Central"](http://www.mathworks.com/matlabcentral/fileexchange/45926-feature-mutual-information-fmi-image-fusion-metric). *www.mathworks.com*. Retrieved 4 April 2018.

[^21]: ["InfoTopo: Topological Information Data Analysis. Deep statistical unsupervised and supervised learning - File Exchange - Github"](https://infotopo.readthedocs.io/en/latest/index.html). *github.com/pierrebaudot/infotopopy/*. Retrieved 26 September 2020.

[^22]: Massey, James (1990). "Causality, Feedback And Directed Informatio". *Proc. 1990 Intl. Symp. on Info. Th. and its Applications, Waikiki, Hawaii, Nov. 27-30, 1990*. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.36.5688](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.36.5688).

[^23]: Permuter, Haim Henry; Weissman, Tsachy; Goldsmith, Andrea J. (February 2009). "Finite State Channels With Time-Invariant Deterministic Feedback". *IEEE Transactions on Information Theory*. **55** (2): 644–662\. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[cs/0608070](https://arxiv.org/abs/cs/0608070). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1109/TIT.2008.2009849](https://doi.org/10.1109%2FTIT.2008.2009849). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [13178](https://api.semanticscholar.org/CorpusID:13178).

[^footnotecoombsdawestversky1970-24]: [Coombs, Dawes & Tversky 1970](https://en.wikipedia.org/wiki/#CITEREFCoombsDawesTversky1970).

[^pressflannery-25]: Press, WH; Teukolsky, SA; Vetterling, WT; Flannery, BP (2007). ["Section 14.7.3. Conditional Entropy and Mutual Information"](https://web.archive.org/web/20110811154417/http://apps.nrbook.com/empanel/index.html#pg=758). *Numerical Recipes: The Art of Scientific Computing* (3rd ed.). New York: Cambridge University Press. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-521-88068-8](https://en.wikipedia.org/wiki/Special:BookSources/978-0-521-88068-8 "Special:BookSources/978-0-521-88068-8"). Archived from [the original](http://apps.nrbook.com/empanel/index.html#pg=758) on 2011-08-11. Retrieved 2011-08-13.

[^jimwhite-26]: White, Jim; Steingold, Sam; Fournelle, Connie. [*Performance Metrics for Group-Detection Algorithms*](https://web.archive.org/web/20160705074827/http://www.interfacesymposia.org/I04/I2004Proceedings/WhiteJim/WhiteJim.paper.pdf) (PDF). Interface 2004. Archived from the original on 2016-07-05. Retrieved 2014-02-19.

[^drwijaya-27]: Wijaya, Dedy Rahman; Sarno, Riyanarto; Zulaika, Enny (2017). "Information Quality Ratio as a novel metric for mother wavelet selection". *Chemometrics and Intelligent Laboratory Systems*. **160**: 59–71\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1016/j.chemolab.2016.11.012](https://doi.org/10.1016%2Fj.chemolab.2016.11.012).

[^strehl-jmlr02-28]: Strehl, Alexander; Ghosh, Joydeep (2003). ["Cluster Ensembles – A Knowledge Reuse Framework for Combining Multiple Partitions"](http://www.jmlr.org/papers/volume3/strehl02a/strehl02a.pdf) (PDF). *The Journal of Machine Learning Research*. **3**: 583–617\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1162/153244303321897735](https://doi.org/10.1162%2F153244303321897735).

[^weighted-kl-29]: Kvålseth, T. O. (1991). "The relative useful information measure: some comments". *Information Sciences*. **56** (1): 35–38\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1016/0020-0255(91)90022-m](https://doi.org/10.1016%2F0020-0255%2891%2990022-m).

[^30]: Pocock, A. (2012). [*Feature Selection Via Joint Likelihood*](http://www.cs.man.ac.uk/~gbrown/publications/pocockPhDthesis.pdf) (PDF) (Thesis).

[^magerman-31]: [Parsing a Natural Language Using Mutual Information Statistics](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.78.4178&rep=rep1&type=pdf) by David M. Magerman and Mitchell P. Marcus

[^everett56-32]: [Hugh Everett](https://en.wikipedia.org/wiki/Hugh_Everett "Hugh Everett") [Theory of the Universal Wavefunction](https://www.pbs.org/wgbh/nova/manyworlds/pdf/dissertation.pdf), Thesis, Princeton University, (1956, 1973), pp 1–140 (page 30)

[^everett57-33]: [Everett, Hugh](https://en.wikipedia.org/wiki/Hugh_Everett "Hugh Everett") (1957). ["Relative State Formulation of Quantum Mechanics"](https://web.archive.org/web/20111027191052/http://www.univer.omsk.su/omsk/Sci/Everett/paper1957.html). *Reviews of Modern Physics*. **29** (3): 454–462\. [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[1957RvMP...29..454E](https://ui.adsabs.harvard.edu/abs/1957RvMP...29..454E). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1103/revmodphys.29.454](https://doi.org/10.1103%2Frevmodphys.29.454). Archived from [the original](http://www.univer.omsk.su/omsk/Sci/Everett/paper1957.html) on 2011-10-27. Retrieved 2012-07-16.

[^34]: Nicoletti, Giorgio; Busiello, Daniel Maria (2021-11-22). ["Mutual Information Disentangles Interactions from Changing Environments"](https://link.aps.org/doi/10.1103/PhysRevLett.127.228301). *Physical Review Letters*. **127** (22): 228301. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[2107.08985](https://arxiv.org/abs/2107.08985). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2021PhRvL.127v8301N](https://ui.adsabs.harvard.edu/abs/2021PhRvL.127v8301N). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1103/PhysRevLett.127.228301](https://doi.org/10.1103%2FPhysRevLett.127.228301). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [34889638](https://pubmed.ncbi.nlm.nih.gov/34889638). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [236087228](https://api.semanticscholar.org/CorpusID:236087228).

[^35]: Nicoletti, Giorgio; Busiello, Daniel Maria (2022-07-29). ["Mutual information in changing environments: Nonlinear interactions, out-of-equilibrium systems, and continuously varying diffusivities"](https://link.aps.org/doi/10.1103/PhysRevE.106.014153). *Physical Review E*. **106** (1): 014153. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[2204.01644](https://arxiv.org/abs/2204.01644). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2022PhRvE.106a4153N](https://ui.adsabs.harvard.edu/abs/2022PhRvE.106a4153N). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1103/PhysRevE.106.014153](https://doi.org/10.1103%2FPhysRevE.106.014153). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [35974654](https://pubmed.ncbi.nlm.nih.gov/35974654).

[^36]: [GlobalMIT](https://code.google.com/p/globalmit) at [Google Code](https://en.wikipedia.org/wiki/Google_Code "Google Code")

[^37]: Lee, Se Yoon (2021). "Gibbs sampler and coordinate ascent variational inference: A set-theoretical review". *Communications in Statistics - Theory and Methods*. **51** (6): 1549–1568\. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[2008.01006](https://arxiv.org/abs/2008.01006). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1080/03610926.2021.1921214](https://doi.org/10.1080%2F03610926.2021.1921214). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [220935477](https://api.semanticscholar.org/CorpusID:220935477).

[^38]: Keys, Dustin; Kholikov, Shukur; Pevtsov, Alexei A. (February 2015). "Application of Mutual Information Methods in Time Distance Helioseismology". *Solar Physics*. **290** (3): 659–671\. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[1501.05597](https://arxiv.org/abs/1501.05597). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2015SoPh..290..659K](https://ui.adsabs.harvard.edu/abs/2015SoPh..290..659K). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1007/s11207-015-0650-y](https://doi.org/10.1007%2Fs11207-015-0650-y). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [118472242](https://api.semanticscholar.org/CorpusID:118472242).

[^iic-39]: [Invariant Information Clustering for Unsupervised Image Classification and Segmentation](https://arxiv.org/abs/1807.06653) by Xu Ji, Joao Henriques and Andrea Vedaldi

[^40]: Nicoletti, Giorgio; Busiello, Daniel Maria (2024-04-08). ["Information Propagation in Multilayer Systems with Higher-Order Interactions across Timescales"](https://link.aps.org/doi/10.1103/PhysRevX.14.021007). *Physical Review X*. **14** (2): 021007. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[2312.06246](https://arxiv.org/abs/2312.06246). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2024PhRvX..14b1007N](https://ui.adsabs.harvard.edu/abs/2024PhRvX..14b1007N). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1103/PhysRevX.14.021007](https://doi.org/10.1103%2FPhysRevX.14.021007).

## References

- Baudot, P.; Tapia, M.; Bennequin, D.; Goaillard, J.M. (2019). ["Topological Information Data Analysis"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7515398). *Entropy*. **21** (9). 869. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[1907.04242](https://arxiv.org/abs/1907.04242). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2019Entrp..21..869B](https://ui.adsabs.harvard.edu/abs/2019Entrp..21..869B). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.3390/e21090869](https://doi.org/10.3390%2Fe21090869). [PMC](https://en.wikipedia.org/wiki/PMC_\(identifier\) "PMC (identifier)") [7515398](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7515398). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [195848308](https://api.semanticscholar.org/CorpusID:195848308).
- Cilibrasi, R.; Vitányi, Paul (2005). ["Clustering by compression"](http://www.cwi.nl/~paulv/papers/cluster.pdf) (PDF). *IEEE Transactions on Information Theory*. **51** (4): 1523–1545\. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[cs/0312044](https://arxiv.org/abs/cs/0312044). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1109/TIT.2005.844059](https://doi.org/10.1109%2FTIT.2005.844059). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [911](https://api.semanticscholar.org/CorpusID:911).
- Cronbach, L. J. (1954). "On the non-rational application of information measures in psychology". In [Quastler, Henry](https://en.wikipedia.org/wiki/Henry_Quastler "Henry Quastler") (ed.). *Information Theory in Psychology: Problems and Methods*. Glencoe, Illinois: Free Press. pp. 14–30.
- Coombs, C. H.; Dawes, R. M.; Tversky, A. (1970). *Mathematical Psychology: An Elementary Introduction*. Englewood Cliffs, New Jersey: Prentice-Hall.
- Church, Kenneth Ward; Hanks, Patrick (1989). ["Word association norms, mutual information, and lexicography"](https://doi.org/10.3115%2F981623.981633). *Proceedings of the 27th Annual Meeting of the Association for Computational Linguistics*. **16** (1): 76–83\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.3115/981623.981633](https://doi.org/10.3115%2F981623.981633).
- Gel'fand, I.M.; Yaglom, A.M. (1957). "Calculation of amount of information about a random function contained in another such function". *American Mathematical Society Translations*. Series 2. **12**: 199–246\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1090/trans2/012/09](https://doi.org/10.1090%2Ftrans2%2F012%2F09). [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [9780821817124](https://en.wikipedia.org/wiki/Special:BookSources/9780821817124 "Special:BookSources/9780821817124"). English translation of original in *Uspekhi Matematicheskikh Nauk* **12** (1): 3-52.
- Guiasu, Silviu (1977). *Information Theory with Applications*. McGraw-Hill, New York. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-07-025109-0](https://en.wikipedia.org/wiki/Special:BookSources/978-0-07-025109-0 "Special:BookSources/978-0-07-025109-0").
- Li, Ming; Vitányi, Paul (February 1997). *An introduction to Kolmogorov complexity and its applications*. New York: [Springer-Verlag](https://en.wikipedia.org/wiki/Springer-Verlag "Springer-Verlag"). [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-387-94868-3](https://en.wikipedia.org/wiki/Special:BookSources/978-0-387-94868-3 "Special:BookSources/978-0-387-94868-3").
- Lockhead, G. R. (1970). "Identification and the form of multidimensional discrimination space". *Journal of Experimental Psychology*. **85** (1): 1–10\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1037/h0029508](https://doi.org/10.1037%2Fh0029508). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [5458322](https://pubmed.ncbi.nlm.nih.gov/5458322).
- David J. C. MacKay. *[Information Theory, Inference, and Learning Algorithms](http://www.inference.phy.cam.ac.uk/mackay/itila/book.html)* Cambridge: Cambridge University Press, 2003. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [0-521-64298-1](https://en.wikipedia.org/wiki/Special:BookSources/0-521-64298-1 "Special:BookSources/0-521-64298-1") (available free online)
- Haghighat, M. B. A.; Aghagolzadeh, A.; Seyedarabi, H. (2011). "A non-reference image fusion metric based on mutual information of image features". *Computers & Electrical Engineering*. **37** (5): 744–756\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1016/j.compeleceng.2011.07.012](https://doi.org/10.1016%2Fj.compeleceng.2011.07.012). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [7738541](https://api.semanticscholar.org/CorpusID:7738541).
- [Athanasios Papoulis](https://en.wikipedia.org/wiki/Athanasios_Papoulis "Athanasios Papoulis"). *Probability, Random Variables, and Stochastic Processes*, second edition. New York: McGraw-Hill, 1984. *(See Chapter 15.)*
- Witten, Ian H. & Frank, Eibe (2005). [*Data Mining: Practical Machine Learning Tools and Techniques*](http://www.cs.waikato.ac.nz/~ml/weka/book.html). Morgan Kaufmann, Amsterdam. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-12-374856-0](https://en.wikipedia.org/wiki/Special:BookSources/978-0-12-374856-0 "Special:BookSources/978-0-12-374856-0").
- Peng, H.C.; Long, F. & Ding, C. (2005). ["Feature selection based on mutual information: criteria of max-dependency, max-relevance, and min-redundancy"](http://research.janelia.org/peng/proj/mRMR/index.htm). *IEEE Transactions on Pattern Analysis and Machine Intelligence*. **27** (8): 1226–1238\. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.63.5765](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.63.5765). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1109/tpami.2005.159](https://doi.org/10.1109%2Ftpami.2005.159). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [16119262](https://pubmed.ncbi.nlm.nih.gov/16119262). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [206764015](https://api.semanticscholar.org/CorpusID:206764015).
- Andre S. Ribeiro; Stuart A. Kauffman; Jason Lloyd-Price; Bjorn Samuelsson & Joshua Socolar (2008). "Mutual Information in Random Boolean models of regulatory networks". *Physical Review E*. **77** (1): 011901. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[0707.3642](https://arxiv.org/abs/0707.3642). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2008PhRvE..77a1901R](https://ui.adsabs.harvard.edu/abs/2008PhRvE..77a1901R). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1103/physreve.77.011901](https://doi.org/10.1103%2Fphysreve.77.011901). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [18351870](https://pubmed.ncbi.nlm.nih.gov/18351870). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [15232112](https://api.semanticscholar.org/CorpusID:15232112).
- Wells, W.M. III; Viola, P.; Atsumi, H.; Nakajima, S.; Kikinis, R. (1996). ["Multi-modal volume registration by maximization of mutual information"](https://web.archive.org/web/20080906201633/http://www.ai.mit.edu/people/sw/papers/mia.pdf) (PDF). *Medical Image Analysis*. **1** (1): 35–51\. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1016/S1361-8415(01)80004-9](https://doi.org/10.1016%2FS1361-8415%2801%2980004-9). [PMID](https://en.wikipedia.org/wiki/PMID_\(identifier\) "PMID (identifier)") [9873920](https://pubmed.ncbi.nlm.nih.gov/9873920). Archived from [the original](http://www.ai.mit.edu/people/sw/papers/mia.pdf) (PDF) on 2008-09-06. Retrieved 2010-08-05.
- Pandey, Biswajit; Sarkar, Suman (2017). ["How much a galaxy knows about its large-scale environment?: An information theoretic perspective"](https://doi.org/10.1093%2Fmnrasl%2Fslw250). *Monthly Notices of the Royal Astronomical Society Letters*. **467** (1): L6. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[1611.00283](https://arxiv.org/abs/1611.00283). [Bibcode](https://en.wikipedia.org/wiki/Bibcode_\(identifier\) "Bibcode (identifier)"):[2017MNRAS.467L...6P](https://ui.adsabs.harvard.edu/abs/2017MNRAS.467L...6P). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1093/mnrasl/slw250](https://doi.org/10.1093%2Fmnrasl%2Fslw250). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [119095496](https://api.semanticscholar.org/CorpusID:119095496).

- Janssen, Joseph; Guan, Vincent; Robeva, Elina (2023). ["Ultra-marginal Feature Importance: Learning from Data with Causal Guarantees"](https://proceedings.mlr.press/v206/janssen23a.html). *International Conference on Artificial Intelligence and Statistics*: 10782–10814\. [arXiv](https://en.wikipedia.org/wiki/ArXiv_\(identifier\) "ArXiv (identifier)"):[2204.09938](https://arxiv.org/abs/2204.09938).

![[Clippings/attachments/2dbeb1435b5a0041290af1991c7d9a0d_MD5.png]]