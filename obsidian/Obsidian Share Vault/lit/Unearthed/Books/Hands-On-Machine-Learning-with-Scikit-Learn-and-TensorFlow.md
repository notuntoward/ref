---
created date: 2025-05-26T15:40:55-07:00
modified date: 2025-05-26T15:40:55-07:00
---
Hands-On Machine Learning with Scikit-Learn and TensorFlow
Concepts, Tools, and Techniques to Build Intelligent Systems
Aurélien Géron
BOOK
KINDLE
B06XNKV5TS
false
2025-03-09T00:23:14.618Z


---
> <div style="background-color: #ffd700; padding: 12px;">​StratifiedShuffleSplit​</div>

**Note:** StratifiedShuffleSplitGéron, Aurélien. Hands-On Machine Learning with Scikit-Learn and TensorFlow: Concepts, Tools, and Techniques to Build Intelligent Systems (p. 52). O'Reilly Media. Kindle Edition.
**Location:** Page: 52


---
> <div style="background-color: #ffd700; padding: 12px;">​Figure 2-14. Standard correlation coefficient of various datasets (source: Wikipedia; public domain image)​</div>

**Note:** Nice graph showing clear x/y relationships with zero correlation.
**Location:** Page: 57


---
> <div style="background-color: #ffd700; padding: 12px;">​tail-heavy distribution, so you may want to transform​</div>

**Note:** Tail heavy distributions can (I assume) be made more normal by log tranformation.  I guess this might fit some modeling assumptions better.
**Location:** Page: 59


---
> <div style="background-color: #ffd700; padding: 12px;">​the median of that attribute:​</div>

**Note:** scikit-learn has a built-in median-substitution missing data imputer.  But using it seems like a bad idea.
**Location:** Page: 61


---
> <div style="background-color: #4682b4; padding: 12px;">​Estimators.​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​fit()​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​fit_transform()​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​predict()​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​Predictors.​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​score()​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​transform()​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​Transformers.​</div>

**Note:** 
**Location:** Page: 62


---
> <div style="background-color: #4682b4; padding: 12px;">​factorize()​</div>

**Note:** 
**Location:** Page: 63


---
> <div style="background-color: #4682b4; padding: 12px;">​hyperparameters​</div>

**Note:** 
**Location:** Page: 63


---
> <div style="background-color: #4682b4; padding: 12px;">​learned parameters are​</div>

**Note:** 
**Location:** Page: 63


---
> <div style="background-color: #4682b4; padding: 12px;">​underscore suffix​</div>

**Note:** 
**Location:** Page: 63


---
> <div style="background-color: #4682b4; padding: 12px;">​CategoricalEncoder​</div>

**Note:** 
**Location:** Page: 64


---
> <div style="background-color: #4682b4; padding: 12px;">​create one binary attribute per category:​</div>

**Note:** 
**Location:** Page: 64


---
> <div style="background-color: #4682b4; padding: 12px;">​OneHotEncoder​</div>

**Note:** 
**Location:** Page: 64


---
> <div style="background-color: #4682b4; padding: 12px;">​one-hot encoding,​</div>

**Note:** 
**Location:** Page: 64


---
> <div style="background-color: #4682b4; padding: 12px;">​BaseEstimator​</div>

**Note:** 
**Location:** Page: 65


---
> <div style="background-color: #4682b4; padding: 12px;">​TransformerMixin​</div>

**Note:** 
**Location:** Page: 65


---
> <div style="background-color: #4682b4; padding: 12px;">​normalization)​</div>

**Note:** 
**Location:** Page: 67


---
> <div style="background-color: #4682b4; padding: 12px;">​Standardization​</div>

**Note:** 
**Location:** Page: 67


---
> <div style="background-color: #ffd700; padding: 12px;">​There is nothing in Scikit-Learn to handle Pandas DataFrames,​</div>

**Note:** 
**Location:** Page: 68


---
> <div style="background-color: #4682b4; padding: 12px;">​FeatureUnion​</div>

**Note:** 
**Location:** Page: 69


---
> <div style="background-color: #ffd700; padding: 12px;">​full_pipeline.fit_transform(​</div>

**Note:** Call fit_transform() on train; call transform() on test.
**Location:** Page: 69


---
> <div style="background-color: #ffd700; padding: 12px;">​cross-validation features expect a utility function (greater is better)​</div>

**Note:** 
**Location:** Page: 71


---
> <div style="background-color: #ffd700; padding: 12px;">​K-fold cross-validation: it​</div>

**Note:** 
**Location:** Page: 71


---
> <div style="background-color: #4682b4; padding: 12px;">​GridSearchCV​</div>

**Note:** 
**Location:** Page: 73


---
> <div style="background-color: #ffd700; padding: 12px;">​can treat some of the data preparation steps as hyperparameters.​</div>

**Note:** 
**Location:** Page: 75


---
> <div style="background-color: #4682b4; padding: 12px;">​RandomizedSearchCV​</div>

**Note:** 
**Location:** Page: 75


---
> <div style="background-color: #ffd700; padding: 12px;">​(call transform(), not fit_transform()!),​</div>

**Note:** 
**Location:** Page: 77


---
> <div style="background-color: #ffd700; padding: 12px;">​full_pipeline.transform(​</div>

**Note:** 
**Location:** Page: 77


---
> <div style="background-color: #4682b4; padding: 12px;">​FN​</div>

**Note:** 
**Location:** Page: 87


---
> <div style="background-color: #4682b4; padding: 12px;">​FP​</div>

**Note:** 
**Location:** Page: 87


---
> <div style="background-color: #4682b4; padding: 12px;">​precision​</div>

**Note:** 
**Location:** Page: 87


---
> <div style="background-color: #4682b4; padding: 12px;">​recall,​</div>

**Note:** 
**Location:** Page: 87


---
> <div style="background-color: #4682b4; padding: 12px;">​sensitivity​</div>

**Note:** 
**Location:** Page: 87


---
> <div style="background-color: #4682b4; padding: 12px;">​TP​</div>

**Note:** 
**Location:** Page: 87


---
> <div style="background-color: #4682b4; padding: 12px;">​true positive rate (TPR):​</div>

**Note:** 
**Location:** Page: 87


---
> <div style="background-color: #4682b4; padding: 12px;">​F1 score, in​</div>

**Note:** 
**Location:** Page: 88


---
> <div style="background-color: #ffd700; padding: 12px;">​="decision_function")​</div>

**Note:** 
**Location:** Page: 90


---
> <div style="background-color: #4682b4; padding: 12px;">​decision_function()​</div>

**Note:** 
**Location:** Page: 90


---
> <div style="background-color: #4682b4; padding: 12px;">​precision_recall_curve()​</div>

**Note:** 
**Location:** Page: 90


---
> <div style="background-color: #4682b4; padding: 12px;">​FPR​</div>

**Note:** 
**Location:** Page: 93


---
> <div style="background-color: #ffd700; padding: 12px;">​ROC curve plots the true positive rate (another name for recall) against the false positive rate. The​</div>

**Note:** 
**Location:** Page: 93


---
> <div style="background-color: #4682b4; padding: 12px;">​specificity.​</div>

**Note:** 
**Location:** Page: 93


---
> <div style="background-color: #4682b4; padding: 12px;">​(AUC).​</div>

**Note:** 
**Location:** Page: 94


---
> <div style="background-color: #ffd700; padding: 12px;">​prefer the PR curve whenever the positive class is rare or when you care more about the false positives than the false negatives, and the ROC curve otherwise.​</div>

**Note:** 
**Location:** Page: 94


---
> <div style="background-color: #4682b4; padding: 12px;">​one-versus-all (OvA) strategy​</div>

**Note:** 
**Location:** Page: 96


---
> <div style="background-color: #4682b4; padding: 12px;">​one-versus-one (OvO) strategy.​</div>

**Note:** 
**Location:** Page: 96


---
> <div style="background-color: #4682b4; padding: 12px;">​one-versus-the-rest).​</div>

**Note:** 
**Location:** Page: 96


---
> <div style="background-color: #ffd700; padding: 12px;">​which class wins the most duels.​</div>

**Note:** 
**Location:** Page: 96


---
> <div style="background-color: #ffd700; padding: 12px;">​output multiple classes for each instance.​</div>

**Note:** 
**Location:** Page: 102


---
> <div style="background-color: #ffd700; padding: 12px;">​each label can be multiclass​</div>

**Note:** 
**Location:** Page: 103


---
> <div style="background-color: #ffd700; padding: 12px;">​billions of instances​</div>

**Note:** 
**Location:** Page: 231


---
> <div style="background-color: #ffd700; padding: 12px;">​millions of features​</div>

**Note:** 
**Location:** Page: 231


---
> <div style="background-color: #ffd700; padding: 12px;">​millions of parameters​</div>

**Note:** 
**Location:** Page: 231


---
> <div style="background-color: #4682b4; padding: 12px;">​autodiff).​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #4682b4; padding: 12px;">​automatic differentiating​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #ffd700; padding: 12px;">​C++ implementations​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #ffd700; padding: 12px;">​cloud service to​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #ffd700; padding: 12px;">​compatible with Scikit-Learn.​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #ffd700; padding: 12px;">​main Python API offers much more flexibility​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #4682b4; padding: 12px;">​Pretty Tensor​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #ffd700; padding: 12px;">​Python API​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #ffd700; padding: 12px;">​simplify​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #4682b4; padding: 12px;">​TensorBoard​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #4682b4; padding: 12px;">​tensorflow.contrib.keras)​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #4682b4; padding: 12px;">​(tensorflow.contrib.learn),​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #4682b4; padding: 12px;">​(tensorflow.contrib.slim)​</div>

**Note:** 
**Location:** Page: 233


---
> <div style="background-color: #ffd700; padding: 12px;">​automatically closed at the end​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #ffd700; padding: 12px;">​better way:​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #4682b4; padding: 12px;">​devices​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #ffd700; padding: 12px;">​does not actually perform any computation,​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #ffd700; padding: 12px;">​don’t need a with block​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #4682b4; padding: 12px;">​global_variables_initializer()​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #4682b4; padding: 12px;">​InteractiveSession.​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #ffd700; padding: 12px;">​just creates a computation graph. In​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #4682b4; padding: 12px;">​session​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #4682b4; padding: 12px;">​with​</div>

**Note:** 
**Location:** Page: 235


---
> <div style="background-color: #4682b4; padding: 12px;">​construction phase),​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #ffd700; padding: 12px;">​creating a new Graph​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #ffd700; padding: 12px;">​do need to close​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #ffd700; padding: 12px;">​duplicate nodes.​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #4682b4; padding: 12px;">​execution phase).​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #ffd700; padding: 12px;">​reset​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #ffd700; padding: 12px;">​temporarily making it the default​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #4682b4; padding: 12px;">​tf.reset_default_graph().​</div>

**Note:** 
**Location:** Page: 236


---
> <div style="background-color: #ffd700; padding: 12px;">​Constants​</div>

**Note:** 
**Location:** Page: 237


---
> <div style="background-color: #4682b4; padding: 12px;">​ops​</div>

**Note:** 
**Location:** Page: 237


---
> <div style="background-color: #ffd700; padding: 12px;">​variables​</div>

**Note:** 
**Location:** Page: 237


---
> <div style="background-color: #4682b4; padding: 12px;">​matmul(),​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #4682b4; padding: 12px;">​matrix_inverse()​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #ffd700; padding: 12px;">​multidimensional arrays,​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #4682b4; padding: 12px;">​source ops).​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #4682b4; padding: 12px;">​tensors​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #ffd700; padding: 12px;">​the Python API tensors are simply represented by NumPy ndarrays.​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #4682b4; padding: 12px;">​transpose(),​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #ffd700; padding: 12px;">​will automatically run this on your GPU card if you have one​</div>

**Note:** 
**Location:** Page: 238


---
> <div style="background-color: #4682b4; padding: 12px;">​assign()​</div>

**Note:** 
**Location:** Page: 239


---
> <div style="background-color: #ffd700; padding: 12px;">​important to first normalize the input​</div>

**Note:** 
**Location:** Page: 239


---
> <div style="background-color: #4682b4; padding: 12px;">​(mse).​</div>

**Note:** 
**Location:** Page: 239


---
> <div style="background-color: #4682b4; padding: 12px;">​(n_epochs​</div>

**Note:** 
**Location:** Page: 239


---
> <div style="background-color: #4682b4; padding: 12px;">​random_uniform()​</div>

**Note:** 
**Location:** Page: 239


---
> <div style="background-color: #ffd700; padding: 12px;">​When using Gradient Descent,​</div>

**Note:** 
**Location:** Page: 239


---
> <div style="background-color: #ffd700; padding: 12px;">​autodiff feature comes to the rescue: it can automatically and efficiently compute the gradients​</div>

**Note:** 
**Location:** Page: 240


---
> <div style="background-color: #4682b4; padding: 12px;">​gradients()​</div>

**Note:** 
**Location:** Page: 240


---
> <div style="background-color: #ffd700; padding: 12px;">​symbolic differentiation​</div>

**Note:** 
**Location:** Page: 240


---
> <div style="background-color: #ffd700; padding: 12px;">​would not necessarily be very efficient.​</div>

**Note:** 
**Location:** Page: 240


---
> <div style="background-color: #ffd700; padding: 12px;">​are many inputs and few outputs,​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #ffd700; padding: 12px;">​computes all the partial derivatives of the outputs with regards to all the inputs​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #ffd700; padding: 12px;">​four main approaches to computing gradients automatically.​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #4682b4; padding: 12px;">​placeholder()​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #4682b4; padding: 12px;">​placeholder nodes.​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #ffd700; padding: 12px;">​replace X and y at every iteration with the next mini-batch.​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #4682b4; padding: 12px;">​reverse-mode autodiff,​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #ffd700; padding: 12px;">​typically used to pass the training data to TensorFlow during training.​</div>

**Note:** 
**Location:** Page: 241


---
> <div style="background-color: #4682b4; padding: 12px;">​feed_dict​</div>

**Note:** 
**Location:** Page: 242


---
> <div style="background-color: #ffd700; padding: 12px;">​fetch the mini-batches one by one, then provide the value of X and y via the feed_dict parameter​</div>

**Note:** 
**Location:** Page: 242


---
> <div style="background-color: #ffd700; padding: 12px;">​specifies the value of A.​</div>

**Note:** 
**Location:** Page: 242


---
> <div style="background-color: #4682b4; padding: 12px;">​restore()​</div>

**Note:** 
**Location:** Page: 243


---
> <div style="background-color: #4682b4; padding: 12px;">​save()​</div>

**Note:** 
**Location:** Page: 243


---
> <div style="background-color: #4682b4; padding: 12px;">​Saver​</div>

**Note:** 
**Location:** Page: 243


---
> <div style="background-color: #4682b4; padding: 12px;">​tf.train.import_meta_graph().​</div>

**Note:** 
**Location:** Page: 244


---
> <div style="background-color: #4682b4; padding: 12px;">​at the very end of the construction phase:​</div>

**Note:** 
**Location:** Page: 245


---
> <div style="background-color: #4682b4; padding: 12px;">​events file.​</div>

**Note:** 
**Location:** Page: 245


---
> <div style="background-color: #4682b4; padding: 12px;">​FileWriter​</div>

**Note:** 
**Location:** Page: 245


---
> <div style="background-color: #4682b4; padding: 12px;">​name scopes​</div>

**Note:** 
**Location:** Page: 247


---
> <div style="background-color: #ffd700; padding: 12px;">​a class for each module​</div>

**Note:** 
**Location:** Page: 250


---
> <div style="background-color: #ffd700; padding: 12px;">​a Python dictionary​</div>

**Note:** 
**Location:** Page: 250


---
> <div style="background-color: #ffd700; padding: 12px;">​containing all the variables in their model, and pass it around to every function.​</div>

**Note:** 
**Location:** Page: 250


---
> <div style="background-color: #ffd700; padding: 12px;">​shared variable as an attribute​</div>

**Note:** 
**Location:** Page: 250


---
> <div style="background-color: #4682b4; padding: 12px;">​get_variable()​</div>

**Note:** 
**Location:** Page: 251


---
> <div style="background-color: #ffa500; padding: 12px;">​TensorFlow offers another option,​</div>

**Note:** 
**Location:** Page: 251


---
> <div style="background-color: #4682b4; padding: 12px;">​variable_scope().​</div>

**Note:** 
**Location:** Page: 251


---
> <div style="background-color: #ffd700; padding: 12px;">​creates the threshold variable within the relu() function upon​</div>

**Note:** 
**Location:** Page: 252


---
> <div style="background-color: #ffd700; padding: 12px;">​ANNs frequently outperform other ML techniques on very large and complex problems.​</div>

**Note:** 
**Location:** Page: 256


---
> <div style="background-color: #ffd700; padding: 12px;">​huge positive impact.​</div>

**Note:** 
**Location:** Page: 256


---
> <div style="background-color: #ffd700; padding: 12px;">​only slightly different from the ones used in the 1990s,​</div>

**Note:** 
**Location:** Page: 256


---
> <div style="background-color: #ffd700; padding: 12px;">​small tweaks​</div>

**Note:** 
**Location:** Page: 256


---
> <div style="background-color: #ffd700; padding: 12px;">​activates​</div>

**Note:** 
**Location:** Page: 258


---
> <div style="background-color: #4682b4; padding: 12px;">​artificial neuron:​</div>

**Note:** 
**Location:** Page: 258


---
> <div style="background-color: #ffd700; padding: 12px;">​binary (on/off)​</div>

**Note:** 
**Location:** Page: 258


---
> <div style="background-color: #ffd700; padding: 12px;">​certain number of its inputs are active.​</div>

**Note:** 
**Location:** Page: 258


---
> <div style="background-color: #ffd700; padding: 12px;">​possible to build a network of artificial neurons that computes any logical proposition​</div>

**Note:** 
**Location:** Page: 258


---
> <div style="background-color: #4682b4; padding: 12px;">​Heaviside step function​</div>

**Note:** 
**Location:** Page: 259


---
> <div style="background-color: #4682b4; padding: 12px;">​linear threshold unit (LTU):​</div>

**Note:** 
**Location:** Page: 259


---
> <div style="background-color: #4682b4; padding: 12px;">​Perceptron​</div>

**Note:** 
**Location:** Page: 259


---
> <div style="background-color: #4682b4; padding: 12px;">​bias neuron,​</div>

**Note:** 
**Location:** Page: 260


---
> <div style="background-color: #ffd700; padding: 12px;">​can be used for simple linear binary classification.​</div>

**Note:** 
**Location:** Page: 260


---
> <div style="background-color: #ffd700; padding: 12px;">​connected to all​</div>

**Note:** 
**Location:** Page: 260


---
> <div style="background-color: #4682b4; padding: 12px;">​Hebb’s rule.​</div>

**Note:** 
**Location:** Page: 260


---
> <div style="background-color: #4682b4; padding: 12px;">​input neurons:​</div>

**Note:** 
**Location:** Page: 260


---
> <div style="background-color: #ffd700; padding: 12px;">​output whatever input they are fed.​</div>

**Note:** 
**Location:** Page: 260


---
> <div style="background-color: #ffd700; padding: 12px;">​single layer of LTUs,​</div>

**Note:** 
**Location:** Page: 260


---
> <div style="background-color: #ffd700; padding: 12px;">​“Cells that fire together, wire​</div>

**Note:** 
**Location:** Page: 261


---
> <div style="background-color: #ffd700; padding: 12px;">​decision boundary of each output neuron is linear,​</div>

**Note:** 
**Location:** Page: 261


---
> <div style="background-color: #ffd700; padding: 12px;">​does not reinforce connections that lead to the wrong output.​</div>

**Note:** 
**Location:** Page: 261


---
> <div style="background-color: #4682b4; padding: 12px;">​Hebbian learning);​</div>

**Note:** 
**Location:** Page: 261


---
> <div style="background-color: #4682b4; padding: 12px;">​Perceptron convergence theorem.​</div>

**Note:** 
**Location:** Page: 261


---
> <div style="background-color: #ffd700; padding: 12px;">​together.”​</div>

**Note:** 
**Location:** Page: 261


---
> <div style="background-color: #ffd700; padding: 12px;">​can solve the XOR​</div>

**Note:** 
**Location:** Page: 262


---
> <div style="background-color: #4682b4; padding: 12px;">​Multi-Layer Perceptron (MLP).​</div>

**Note:** 
**Location:** Page: 262


---
> <div style="background-color: #ffd700; padding: 12px;">​some of the limitations of Perceptrons can be eliminated by stacking multiple Perceptrons.​</div>

**Note:** 
**Location:** Page: 262


---
> <div style="background-color: #ffd700; padding: 12px;">​to prefer Logistic Regression over Perceptrons.​</div>

**Note:** 
**Location:** Page: 262


---
> <div style="background-color: #ffd700; padding: 12px;">​computes how much each neuron in the last hidden layer contributed to each output neuron’s error.​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #ffd700; padding: 12px;">​computes the output of every neuron in each consecutive layer​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #4682b4; padding: 12px;">​deep neural network (DNN).​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #ffd700; padding: 12px;">​each training instance,​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #4682b4; padding: 12px;">​forward pass,​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #ffd700; padding: 12px;">​Gradient Descent using reverse-mode autodiff (Gradient​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #4682b4; padding: 12px;">​hidden layers,​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #ffd700; padding: 12px;">​measures the error gradient across all the connection weights​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #4682b4; padding: 12px;">​output layer​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #ffd700; padding: 12px;">​two or more hidden layers,​</div>

**Note:** 
**Location:** Page: 263


---
> <div style="background-color: #ffd700; padding: 12px;">​does not have a maximum output value​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #ffd700; padding: 12px;">​Gradient Descent step on all the connection weights​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #4682b4; padding: 12px;">​hyperbolic tangent function​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #ffd700; padding: 12px;">​last step​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #ffd700; padding: 12px;">​make Gradient Descent bounce around).​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #ffd700; padding: 12px;">​not differentiable​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #4682b4; padding: 12px;">​ReLU function​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #ffd700; padding: 12px;">​replaced the step function with the logistic function,​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #ffd700; padding: 12px;">​tends to make each layer’s output more or less normalized​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #ffd700; padding: 12px;">​works very well​</div>

**Note:** 
**Location:** Page: 264


---
> <div style="background-color: #4682b4; padding: 12px;">​feedforward neural network (FNN).​</div>

**Note:** 
**Location:** Page: 265


---
> <div style="background-color: #ffd700; padding: 12px;">​100 neurons)​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​300 neurons,​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​40,000 training iterations​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​50 instances.​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​activation_fn​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​based on the ReLU​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #4682b4; padding: 12px;">​DNNClassifier​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​experimental code​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #4682b4; padding: 12px;">​tensorflow.contrib​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​two hidden layers​</div>

**Note:** 
**Location:** Page: 266


---
> <div style="background-color: #ffd700; padding: 12px;">​cross entropy​</div>

**Note:** 
**Location:** Page: 267


---
> <div style="background-color: #ffd700; padding: 12px;">​softmax function,​</div>

**Note:** 
**Location:** Page: 267


---
> <div style="background-color: #ffa500; padding: 12px;">​much better to use randomized search​</div>

**Note:** 
**Location:** Page: 272


---
> <div style="background-color: #ffd700; padding: 12px;">​only be able to explore a tiny part of the hyperparameter space​</div>

**Note:** 
**Location:** Page: 272


---
> <div style="background-color: #4682b4; padding: 12px;">​Oscar,​</div>

**Note:** 
**Location:** Page: 272


---
> <div style="background-color: #ffd700; padding: 12px;">​97%​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​98%​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​complex functions using exponentially fewer neurons​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​converge faster​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​deep networks have a much higher​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​dozens of layers​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​even hundreds,​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​generalize to new datasets.​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​lower hidden layers model low-level structures​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​many problems​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​MNIST​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​need a huge amount of training data.​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​one hidden​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​one or two hidden layers​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #4682b4; padding: 12px;">​parameter efficiency​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffd700; padding: 12px;">​Very complex tasks,​</div>

**Note:** 
**Location:** Page: 273


---
> <div style="background-color: #ffa500; padding: 12px;">​classification​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​common practice​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​dropout,​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​early stopping​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​fewer and fewer neurons at each layer​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffa500; padding: 12px;">​form a funnel,​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​Gradient Descent does not get stuck as much on plateaus,​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​increasing the number of layers than the number of neurons per layer.​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​In most cases you can use the ReLU​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​more layers and neurons than you actually need,​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​not as common now,​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​not mutually exclusive​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffa500; padding: 12px;">​simpler approach​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​softmax activation function is generally a good​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​two classes),​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffa500; padding: 12px;">​use the same size for all hidden layers​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​when​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​you generally want to use the logistic function.​</div>

**Note:** 
**Location:** Page: 274


---
> <div style="background-color: #ffd700; padding: 12px;">​add noise to the inputs​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​capable of randomly generating new data​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #4682b4; padding: 12px;">​codings,​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​constraining the network​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #4682b4; padding: 12px;">​generative model.​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​limit the size of the internal representation,​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​prevent the autoencoder from trivially copying​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​recover the original​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​representations of the input​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​unsupervised pretraining of deep neural networks​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffd700; padding: 12px;">​useful for dimensionality reduction​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #ffa500; padding: 12px;">​work by simply learning to copy their inputs to their outputs.​</div>

**Note:** 
**Location:** Page: 419


---
> <div style="background-color: #4682b4; padding: 12px;">​decoder​</div>

**Note:** 
**Location:** Page: 420


---
> <div style="background-color: #4682b4; padding: 12px;">​encoder​</div>

**Note:** 
**Location:** Page: 420


---
> <div style="background-color: #4682b4; padding: 12px;">​generative network)​</div>

**Note:** 
**Location:** Page: 420


---
> <div style="background-color: #4682b4; padding: 12px;">​hailstone sequence).​</div>

**Note:** 
**Location:** Page: 420


---
> <div style="background-color: #4682b4; padding: 12px;">​recognition network)​</div>

**Note:** 
**Location:** Page: 420


---
> <div style="background-color: #ffd700; padding: 12px;">​cannot trivially copy​</div>

**Note:** 
**Location:** Page: 421


---
> <div style="background-color: #ffd700; padding: 12px;">​ends up performing Principal Component Analysis​</div>

**Note:** 
**Location:** Page: 421


---
> <div style="background-color: #ffd700; padding: 12px;">​forced to learn​</div>

**Note:** 
**Location:** Page: 421


---
> <div style="background-color: #ffd700; padding: 12px;">​internal representation has a lower dimensionality than the input data (it​</div>

**Note:** 
**Location:** Page: 421


---
> <div style="background-color: #ffd700; padding: 12px;">​only linear activations​</div>

**Note:** 
**Location:** Page: 421


---
> <div style="background-color: #4682b4; padding: 12px;">​reconstructions​</div>

**Note:** 
**Location:** Page: 421


---
> <div style="background-color: #4682b4; padding: 12px;">​undercomplete.​</div>

**Note:** 
**Location:** Page: 421


---
> <div style="background-color: #4682b4; padding: 12px;">​deep autoencoders).​</div>

**Note:** 
**Location:** Page: 423


---
> <div style="background-color: #ffd700; padding: 12px;">​multiple hidden layers.​</div>

**Note:** 
**Location:** Page: 423


---
> <div style="background-color: #ffd700; padding: 12px;">​one must be careful not to make the autoencoder too powerful.​</div>

**Note:** 
**Location:** Page: 423


---
> <div style="background-color: #4682b4; padding: 12px;">​stacked autoencoders​</div>

**Note:** 
**Location:** Page: 423


---
> <div style="background-color: #ffd700; padding: 12px;">​typically symmetrical with regards to the central hidden layer​</div>

**Note:** 
**Location:** Page: 423


---
> <div style="background-color: #ffd700; padding: 12px;">​easier to just define the layers manually.​</div>

**Note:** 
**Location:** Page: 425


---
> <div style="background-color: #ffd700; padding: 12px;">​tie the weights of the decoder layers to the weights of the encoder layers.​</div>

**Note:** 
**Location:** Page: 425


---
> <div style="background-color: #ffd700; padding: 12px;">​first autoencoder​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffa500; padding: 12px;">​first phase​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffd700; padding: 12px;">​much faster to train one shallow autoencoder at a time,​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffd700; padding: 12px;">​reconstruct the inputs.​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffd700; padding: 12px;">​reconstruct the output of the first autoencoder’s hidden layer.​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffd700; padding: 12px;">​second autoencoder​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffa500; padding: 12px;">​second phase,​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffa500; padding: 12px;">​simplest approach​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffd700; padding: 12px;">​use a different TensorFlow graph for each phase.​</div>

**Note:** 
**Location:** Page: 426


---
> <div style="background-color: #ffa500; padding: 12px;">​Another approach​</div>

**Note:** 
**Location:** Page: 427


---
> <div style="background-color: #ffd700; padding: 12px;">​simply copy the weights and biases from each autoencoder​</div>

**Note:** 
**Location:** Page: 427


---
> <div style="background-color: #ffd700; padding: 12px;">​single graph​</div>

**Note:** 
**Location:** Page: 427


---
> <div style="background-color: #ffd700; padding: 12px;">​add noise to its inputs, training it to recover the original, noise-free inputs.​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #ffd700; padding: 12px;">​coding layer to be just as large as the inputs, or even larger,​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #ffd700; padding: 12px;">​Gaussian​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #ffd700; padding: 12px;">​just train an autoencoder using all the training data, then reuse its encoder layers to create a new neural network​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #ffd700; padding: 12px;">​or​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #ffd700; padding: 12px;">​other kinds of constraints​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #4682b4; padding: 12px;">​overcomplete autoencoder.​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #ffd700; padding: 12px;">​randomly switched off inputs,​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #4682b4; padding: 12px;">​stacked denoising autoencoders.​</div>

**Note:** 
**Location:** Page: 432


---
> <div style="background-color: #ffd700; padding: 12px;">​dropout version, which is more common,​</div>

**Note:** 
**Location:** Page: 433


---
> <div style="background-color: #4682b4; padding: 12px;">​tf.shape(X),​</div>

**Note:** 
**Location:** Page: 433


---
> <div style="background-color: #ffd700; padding: 12px;">​adding an appropriate term to the cost function,​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #ffd700; padding: 12px;">​average activation of each neuron in the coding layer,​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #ffd700; padding: 12px;">​Kullback–Leibler divergence​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #ffd700; padding: 12px;">​layer at each training iteration.​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #ffd700; padding: 12px;">​measure​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #ffd700; padding: 12px;">​only 5% significantly active neurons in the coding layer.​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #ffd700; padding: 12px;">​penalize the neurons that are too active​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #4682b4; padding: 12px;">​sparsity​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #4682b4; padding: 12px;">​sparsity loss​</div>

**Note:** 
**Location:** Page: 434


---
> <div style="background-color: #ffd700; padding: 12px;">​actual probability​</div>

**Note:** 
**Location:** Page: 435


---
> <div style="background-color: #4682b4; padding: 12px;">​KL divergence between the target sparsity p and the actual sparsity q​</div>

**Note:** 
**Location:** Page: 435


---
> <div style="background-color: #4682b4; padding: 12px;">​p​</div>

**Note:** 
**Location:** Page: 435


---
> <div style="background-color: #4682b4; padding: 12px;">​P​</div>

**Note:** 
**Location:** Page: 435


---
> <div style="background-color: #4682b4; padding: 12px;">​q​</div>

**Note:** 
**Location:** Page: 435


---
> <div style="background-color: #4682b4; padding: 12px;">​Q,​</div>

**Note:** 
**Location:** Page: 435


---
> <div style="background-color: #ffd700; padding: 12px;">​target probability​</div>

**Note:** 
**Location:** Page: 435


---
> <div style="background-color: #ffd700; padding: 12px;">​activations of the coding layer must be between 0 and 1​</div>

**Note:** 
**Location:** Page: 436


---
> <div style="background-color: #4682b4; padding: 12px;">​sigmoid_cross_entropy_with_logits()​</div>

**Note:** 
**Location:** Page: 436


---
> <div style="background-color: #ffd700; padding: 12px;">​speed up convergence:​</div>

**Note:** 
**Location:** Page: 436


---
> <div style="background-color: #ffd700; padding: 12px;">​use the logistic activation function for the coding layer:​</div>

**Note:** 
**Location:** Page: 436


---
> <div style="background-color: #ffd700; padding: 12px;">​easier to train and the sampling process is much faster​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​encoder produces a mean coding​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​even after training​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​generative​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​one of the most popular​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​outputs are partly determined by chance,​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​probabilistic​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​sampled randomly from a Gaussian​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​similar to RBMs​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​standard deviation​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #4682b4; padding: 12px;">​variational autoencoders.​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #4682b4; padding: 12px;">​μ​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #4682b4; padding: 12px;">​σ.​</div>

**Note:** 
**Location:** Page: 437


---
> <div style="background-color: #ffd700; padding: 12px;">​actual distribution of the codings.​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #4682b4; padding: 12px;">​coding space​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #ffd700; padding: 12px;">​cost function.​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #ffd700; padding: 12px;">​KL divergence​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #4682b4; padding: 12px;">​latent​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #4682b4; padding: 12px;">​latent space)​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #4682b4; padding: 12px;">​loss​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #ffd700; padding: 12px;">​reconstruction loss​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #ffd700; padding: 12px;">​target distribution​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #ffd700; padding: 12px;">​two parts.​</div>

**Note:** 
**Location:** Page: 438


---
> <div style="background-color: #ffd700; padding: 12px;">​common variant is​</div>

**Note:** 
**Location:** Page: 439


---
> <div style="background-color: #ffd700; padding: 12px;">​train the encoder to output γ = log(σ2)​</div>

**Note:** 
**Location:** Page: 439


---
> <div style="background-color: #4682b4; padding: 12px;">​Contractive autoencoder (CAE)8​</div>

**Note:** 
**Location:** Page: 441


---
> <div style="background-color: #ffd700; padding: 12px;">​derivatives of the codings with regards to the inputs are small.​</div>

**Note:** 
**Location:** Page: 441


---
> <div style="background-color: #ffd700; padding: 12px;">​somewhat overshadowed unsupervised learning,​</div>

**Note:** 
**Location:** Page: 441


---
> <div style="background-color: #ffd700; padding: 12px;">​added capability to generate data.​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #ffd700; padding: 12px;">​competition leads to increasingly realistic fake data,​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #ffd700; padding: 12px;">​convolutional layers.​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #4682b4; padding: 12px;">​“discriminator,”​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #4682b4; padding: 12px;">​Generative Adversarial Network (GAN)12​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #4682b4; padding: 12px;">​Generative stochastic network (GSN)10​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #4682b4; padding: 12px;">​“generator.”​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #ffd700; padding: 12px;">​only the top k% activations for each neuron​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #ffd700; padding: 12px;">​similar inputs must have similar codings.​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #ffd700; padding: 12px;">​sparse convolutional​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #4682b4; padding: 12px;">​Stacked convolutional autoencoders9​</div>

**Note:** 
**Location:** Page: 442


---
> <div style="background-color: #4682b4; padding: 12px;">​Winner-take-all (WTA) autoencoder11​</div>

**Note:** 
**Location:** Page: 442
