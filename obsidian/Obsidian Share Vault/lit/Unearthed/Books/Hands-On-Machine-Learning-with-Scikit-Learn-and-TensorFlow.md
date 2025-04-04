---
created date: 2025-03-09T16:22:15-07:00
modified date: 2025-03-09T16:22:15-07:00
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
> ​StratifiedShuffleSplit​

**Note:** StratifiedShuffleSplitGéron, Aurélien. Hands-On Machine Learning with Scikit-Learn and TensorFlow: Concepts, Tools, and Techniques to Build Intelligent Systems (p. 52). O'Reilly Media. Kindle Edition.
**Location:** Page: 52


---
> ​Figure 2-14. Standard correlation coefficient of various datasets (source: Wikipedia; public domain image)​

**Note:** Nice graph showing clear x/y relationships with zero correlation.
**Location:** Page: 57


---
> ​tail-heavy distribution, so you may want to transform​

**Note:** Tail heavy distributions can (I assume) be made more normal by log tranformation.  I guess this might fit some modeling assumptions better.
**Location:** Page: 59


---
> ​the median of that attribute:​

**Note:** scikit-learn has a built-in median-substitution missing data imputer.  But using it seems like a bad idea.
**Location:** Page: 61


---
> ​Estimators.​

**Note:** 
**Location:** Page: 62


---
> ​fit()​

**Note:** 
**Location:** Page: 62


---
> ​fit_transform()​

**Note:** 
**Location:** Page: 62


---
> ​predict()​

**Note:** 
**Location:** Page: 62


---
> ​Predictors.​

**Note:** 
**Location:** Page: 62


---
> ​score()​

**Note:** 
**Location:** Page: 62


---
> ​transform()​

**Note:** 
**Location:** Page: 62


---
> ​Transformers.​

**Note:** 
**Location:** Page: 62


---
> ​factorize()​

**Note:** 
**Location:** Page: 63


---
> ​hyperparameters​

**Note:** 
**Location:** Page: 63


---
> ​learned parameters are​

**Note:** 
**Location:** Page: 63


---
> ​underscore suffix​

**Note:** 
**Location:** Page: 63


---
> ​CategoricalEncoder​

**Note:** 
**Location:** Page: 64


---
> ​create one binary attribute per category:​

**Note:** 
**Location:** Page: 64


---
> ​OneHotEncoder​

**Note:** 
**Location:** Page: 64


---
> ​one-hot encoding,​

**Note:** 
**Location:** Page: 64


---
> ​BaseEstimator​

**Note:** 
**Location:** Page: 65


---
> ​TransformerMixin​

**Note:** 
**Location:** Page: 65


---
> ​normalization)​

**Note:** 
**Location:** Page: 67


---
> ​Standardization​

**Note:** 
**Location:** Page: 67


---
> ​There is nothing in Scikit-Learn to handle Pandas DataFrames,​

**Note:** 
**Location:** Page: 68


---
> ​FeatureUnion​

**Note:** 
**Location:** Page: 69


---
> ​full_pipeline.fit_transform(​

**Note:** Call fit_transform() on train; call transform() on test.
**Location:** Page: 69


---
> ​cross-validation features expect a utility function (greater is better)​

**Note:** 
**Location:** Page: 71


---
> ​K-fold cross-validation: it​

**Note:** 
**Location:** Page: 71


---
> ​GridSearchCV​

**Note:** 
**Location:** Page: 73


---
> ​can treat some of the data preparation steps as hyperparameters.​

**Note:** 
**Location:** Page: 75


---
> ​RandomizedSearchCV​

**Note:** 
**Location:** Page: 75


---
> ​(call transform(), not fit_transform()!),​

**Note:** 
**Location:** Page: 77


---
> ​full_pipeline.transform(​

**Note:** 
**Location:** Page: 77


---
> ​FN​

**Note:** 
**Location:** Page: 87


---
> ​FP​

**Note:** 
**Location:** Page: 87


---
> ​precision​

**Note:** 
**Location:** Page: 87


---
> ​recall,​

**Note:** 
**Location:** Page: 87


---
> ​sensitivity​

**Note:** 
**Location:** Page: 87


---
> ​TP​

**Note:** 
**Location:** Page: 87


---
> ​true positive rate (TPR):​

**Note:** 
**Location:** Page: 87


---
> ​F1 score, in​

**Note:** 
**Location:** Page: 88


---
> ​="decision_function")​

**Note:** 
**Location:** Page: 90


---
> ​decision_function()​

**Note:** 
**Location:** Page: 90


---
> ​precision_recall_curve()​

**Note:** 
**Location:** Page: 90


---
> ​FPR​

**Note:** 
**Location:** Page: 93


---
> ​ROC curve plots the true positive rate (another name for recall) against the false positive rate. The​

**Note:** 
**Location:** Page: 93


---
> ​specificity.​

**Note:** 
**Location:** Page: 93


---
> ​(AUC).​

**Note:** 
**Location:** Page: 94


---
> ​prefer the PR curve whenever the positive class is rare or when you care more about the false positives than the false negatives, and the ROC curve otherwise.​

**Note:** 
**Location:** Page: 94


---
> ​one-versus-all (OvA) strategy​

**Note:** 
**Location:** Page: 96


---
> ​one-versus-one (OvO) strategy.​

**Note:** 
**Location:** Page: 96


---
> ​one-versus-the-rest).​

**Note:** 
**Location:** Page: 96


---
> ​which class wins the most duels.​

**Note:** 
**Location:** Page: 96


---
> ​output multiple classes for each instance.​

**Note:** 
**Location:** Page: 102


---
> ​each label can be multiclass​

**Note:** 
**Location:** Page: 103


---
> ​billions of instances​

**Note:** 
**Location:** Page: 231


---
> ​millions of features​

**Note:** 
**Location:** Page: 231


---
> ​millions of parameters​

**Note:** 
**Location:** Page: 231


---
> ​autodiff).​

**Note:** 
**Location:** Page: 233


---
> ​automatic differentiating​

**Note:** 
**Location:** Page: 233


---
> ​C++ implementations​

**Note:** 
**Location:** Page: 233


---
> ​cloud service to​

**Note:** 
**Location:** Page: 233


---
> ​compatible with Scikit-Learn.​

**Note:** 
**Location:** Page: 233


---
> ​main Python API offers much more flexibility​

**Note:** 
**Location:** Page: 233


---
> ​Pretty Tensor​

**Note:** 
**Location:** Page: 233


---
> ​Python API​

**Note:** 
**Location:** Page: 233


---
> ​simplify​

**Note:** 
**Location:** Page: 233


---
> ​TensorBoard​

**Note:** 
**Location:** Page: 233


---
> ​tensorflow.contrib.keras)​

**Note:** 
**Location:** Page: 233


---
> ​(tensorflow.contrib.learn),​

**Note:** 
**Location:** Page: 233


---
> ​(tensorflow.contrib.slim)​

**Note:** 
**Location:** Page: 233


---
> ​automatically closed at the end​

**Note:** 
**Location:** Page: 235


---
> ​better way:​

**Note:** 
**Location:** Page: 235


---
> ​devices​

**Note:** 
**Location:** Page: 235


---
> ​does not actually perform any computation,​

**Note:** 
**Location:** Page: 235


---
> ​don’t need a with block​

**Note:** 
**Location:** Page: 235


---
> ​global_variables_initializer()​

**Note:** 
**Location:** Page: 235


---
> ​InteractiveSession.​

**Note:** 
**Location:** Page: 235


---
> ​just creates a computation graph. In​

**Note:** 
**Location:** Page: 235


---
> ​session​

**Note:** 
**Location:** Page: 235


---
> ​with​

**Note:** 
**Location:** Page: 235


---
> ​construction phase),​

**Note:** 
**Location:** Page: 236


---
> ​creating a new Graph​

**Note:** 
**Location:** Page: 236


---
> ​do need to close​

**Note:** 
**Location:** Page: 236


---
> ​duplicate nodes.​

**Note:** 
**Location:** Page: 236


---
> ​execution phase).​

**Note:** 
**Location:** Page: 236


---
> ​reset​

**Note:** 
**Location:** Page: 236


---
> ​temporarily making it the default​

**Note:** 
**Location:** Page: 236


---
> ​tf.reset_default_graph().​

**Note:** 
**Location:** Page: 236


---
> ​Constants​

**Note:** 
**Location:** Page: 237


---
> ​ops​

**Note:** 
**Location:** Page: 237


---
> ​variables​

**Note:** 
**Location:** Page: 237


---
> ​matmul(),​

**Note:** 
**Location:** Page: 238


---
> ​matrix_inverse()​

**Note:** 
**Location:** Page: 238


---
> ​multidimensional arrays,​

**Note:** 
**Location:** Page: 238


---
> ​source ops).​

**Note:** 
**Location:** Page: 238


---
> ​tensors​

**Note:** 
**Location:** Page: 238


---
> ​the Python API tensors are simply represented by NumPy ndarrays.​

**Note:** 
**Location:** Page: 238


---
> ​transpose(),​

**Note:** 
**Location:** Page: 238


---
> ​will automatically run this on your GPU card if you have one​

**Note:** 
**Location:** Page: 238


---
> ​assign()​

**Note:** 
**Location:** Page: 239


---
> ​important to first normalize the input​

**Note:** 
**Location:** Page: 239


---
> ​(mse).​

**Note:** 
**Location:** Page: 239


---
> ​(n_epochs​

**Note:** 
**Location:** Page: 239


---
> ​random_uniform()​

**Note:** 
**Location:** Page: 239


---
> ​When using Gradient Descent,​

**Note:** 
**Location:** Page: 239


---
> ​autodiff feature comes to the rescue: it can automatically and efficiently compute the gradients​

**Note:** 
**Location:** Page: 240


---
> ​gradients()​

**Note:** 
**Location:** Page: 240


---
> ​symbolic differentiation​

**Note:** 
**Location:** Page: 240


---
> ​would not necessarily be very efficient.​

**Note:** 
**Location:** Page: 240


---
> ​are many inputs and few outputs,​

**Note:** 
**Location:** Page: 241


---
> ​computes all the partial derivatives of the outputs with regards to all the inputs​

**Note:** 
**Location:** Page: 241


---
> ​four main approaches to computing gradients automatically.​

**Note:** 
**Location:** Page: 241


---
> ​placeholder()​

**Note:** 
**Location:** Page: 241


---
> ​placeholder nodes.​

**Note:** 
**Location:** Page: 241


---
> ​replace X and y at every iteration with the next mini-batch.​

**Note:** 
**Location:** Page: 241


---
> ​reverse-mode autodiff,​

**Note:** 
**Location:** Page: 241


---
> ​typically used to pass the training data to TensorFlow during training.​

**Note:** 
**Location:** Page: 241


---
> ​feed_dict​

**Note:** 
**Location:** Page: 242


---
> ​fetch the mini-batches one by one, then provide the value of X and y via the feed_dict parameter​

**Note:** 
**Location:** Page: 242


---
> ​specifies the value of A.​

**Note:** 
**Location:** Page: 242


---
> ​restore()​

**Note:** 
**Location:** Page: 243


---
> ​save()​

**Note:** 
**Location:** Page: 243


---
> ​Saver​

**Note:** 
**Location:** Page: 243


---
> ​tf.train.import_meta_graph().​

**Note:** 
**Location:** Page: 244


---
> ​at the very end of the construction phase:​

**Note:** 
**Location:** Page: 245


---
> ​events file.​

**Note:** 
**Location:** Page: 245


---
> ​FileWriter​

**Note:** 
**Location:** Page: 245


---
> ​name scopes​

**Note:** 
**Location:** Page: 247


---
> ​a class for each module​

**Note:** 
**Location:** Page: 250


---
> ​a Python dictionary​

**Note:** 
**Location:** Page: 250


---
> ​containing all the variables in their model, and pass it around to every function.​

**Note:** 
**Location:** Page: 250


---
> ​shared variable as an attribute​

**Note:** 
**Location:** Page: 250


---
> ​get_variable()​

**Note:** 
**Location:** Page: 251


---
> ​TensorFlow offers another option,​

**Note:** 
**Location:** Page: 251


---
> ​variable_scope().​

**Note:** 
**Location:** Page: 251


---
> ​creates the threshold variable within the relu() function upon​

**Note:** 
**Location:** Page: 252


---
> ​ANNs frequently outperform other ML techniques on very large and complex problems.​

**Note:** 
**Location:** Page: 256


---
> ​huge positive impact.​

**Note:** 
**Location:** Page: 256


---
> ​only slightly different from the ones used in the 1990s,​

**Note:** 
**Location:** Page: 256


---
> ​small tweaks​

**Note:** 
**Location:** Page: 256


---
> ​activates​

**Note:** 
**Location:** Page: 258


---
> ​artificial neuron:​

**Note:** 
**Location:** Page: 258


---
> ​binary (on/off)​

**Note:** 
**Location:** Page: 258


---
> ​certain number of its inputs are active.​

**Note:** 
**Location:** Page: 258


---
> ​possible to build a network of artificial neurons that computes any logical proposition​

**Note:** 
**Location:** Page: 258


---
> ​Heaviside step function​

**Note:** 
**Location:** Page: 259


---
> ​linear threshold unit (LTU):​

**Note:** 
**Location:** Page: 259


---
> ​Perceptron​

**Note:** 
**Location:** Page: 259


---
> ​bias neuron,​

**Note:** 
**Location:** Page: 260


---
> ​can be used for simple linear binary classification.​

**Note:** 
**Location:** Page: 260


---
> ​connected to all​

**Note:** 
**Location:** Page: 260


---
> ​Hebb’s rule.​

**Note:** 
**Location:** Page: 260


---
> ​input neurons:​

**Note:** 
**Location:** Page: 260


---
> ​output whatever input they are fed.​

**Note:** 
**Location:** Page: 260


---
> ​single layer of LTUs,​

**Note:** 
**Location:** Page: 260


---
> ​“Cells that fire together, wire​

**Note:** 
**Location:** Page: 261


---
> ​decision boundary of each output neuron is linear,​

**Note:** 
**Location:** Page: 261


---
> ​does not reinforce connections that lead to the wrong output.​

**Note:** 
**Location:** Page: 261


---
> ​Hebbian learning);​

**Note:** 
**Location:** Page: 261


---
> ​Perceptron convergence theorem.​

**Note:** 
**Location:** Page: 261


---
> ​together.”​

**Note:** 
**Location:** Page: 261


---
> ​can solve the XOR​

**Note:** 
**Location:** Page: 262


---
> ​Multi-Layer Perceptron (MLP).​

**Note:** 
**Location:** Page: 262


---
> ​some of the limitations of Perceptrons can be eliminated by stacking multiple Perceptrons.​

**Note:** 
**Location:** Page: 262


---
> ​to prefer Logistic Regression over Perceptrons.​

**Note:** 
**Location:** Page: 262


---
> ​computes how much each neuron in the last hidden layer contributed to each output neuron’s error.​

**Note:** 
**Location:** Page: 263


---
> ​computes the output of every neuron in each consecutive layer​

**Note:** 
**Location:** Page: 263


---
> ​deep neural network (DNN).​

**Note:** 
**Location:** Page: 263


---
> ​each training instance,​

**Note:** 
**Location:** Page: 263


---
> ​forward pass,​

**Note:** 
**Location:** Page: 263


---
> ​Gradient Descent using reverse-mode autodiff (Gradient​

**Note:** 
**Location:** Page: 263


---
> ​hidden layers,​

**Note:** 
**Location:** Page: 263


---
> ​measures the error gradient across all the connection weights​

**Note:** 
**Location:** Page: 263


---
> ​output layer​

**Note:** 
**Location:** Page: 263


---
> ​two or more hidden layers,​

**Note:** 
**Location:** Page: 263


---
> ​does not have a maximum output value​

**Note:** 
**Location:** Page: 264


---
> ​Gradient Descent step on all the connection weights​

**Note:** 
**Location:** Page: 264


---
> ​hyperbolic tangent function​

**Note:** 
**Location:** Page: 264


---
> ​last step​

**Note:** 
**Location:** Page: 264


---
> ​make Gradient Descent bounce around).​

**Note:** 
**Location:** Page: 264


---
> ​not differentiable​

**Note:** 
**Location:** Page: 264


---
> ​ReLU function​

**Note:** 
**Location:** Page: 264


---
> ​replaced the step function with the logistic function,​

**Note:** 
**Location:** Page: 264


---
> ​tends to make each layer’s output more or less normalized​

**Note:** 
**Location:** Page: 264


---
> ​works very well​

**Note:** 
**Location:** Page: 264


---
> ​feedforward neural network (FNN).​

**Note:** 
**Location:** Page: 265


---
> ​100 neurons)​

**Note:** 
**Location:** Page: 266


---
> ​300 neurons,​

**Note:** 
**Location:** Page: 266


---
> ​40,000 training iterations​

**Note:** 
**Location:** Page: 266


---
> ​50 instances.​

**Note:** 
**Location:** Page: 266


---
> ​activation_fn​

**Note:** 
**Location:** Page: 266


---
> ​based on the ReLU​

**Note:** 
**Location:** Page: 266


---
> ​DNNClassifier​

**Note:** 
**Location:** Page: 266


---
> ​experimental code​

**Note:** 
**Location:** Page: 266


---
> ​tensorflow.contrib​

**Note:** 
**Location:** Page: 266


---
> ​two hidden layers​

**Note:** 
**Location:** Page: 266


---
> ​cross entropy​

**Note:** 
**Location:** Page: 267


---
> ​softmax function,​

**Note:** 
**Location:** Page: 267


---
> ​much better to use randomized search​

**Note:** 
**Location:** Page: 272


---
> ​only be able to explore a tiny part of the hyperparameter space​

**Note:** 
**Location:** Page: 272


---
> ​Oscar,​

**Note:** 
**Location:** Page: 272


---
> ​97%​

**Note:** 
**Location:** Page: 273


---
> ​98%​

**Note:** 
**Location:** Page: 273


---
> ​complex functions using exponentially fewer neurons​

**Note:** 
**Location:** Page: 273


---
> ​converge faster​

**Note:** 
**Location:** Page: 273


---
> ​deep networks have a much higher​

**Note:** 
**Location:** Page: 273


---
> ​dozens of layers​

**Note:** 
**Location:** Page: 273


---
> ​even hundreds,​

**Note:** 
**Location:** Page: 273


---
> ​generalize to new datasets.​

**Note:** 
**Location:** Page: 273


---
> ​lower hidden layers model low-level structures​

**Note:** 
**Location:** Page: 273


---
> ​many problems​

**Note:** 
**Location:** Page: 273


---
> ​MNIST​

**Note:** 
**Location:** Page: 273


---
> ​need a huge amount of training data.​

**Note:** 
**Location:** Page: 273


---
> ​one hidden​

**Note:** 
**Location:** Page: 273


---
> ​one or two hidden layers​

**Note:** 
**Location:** Page: 273


---
> ​parameter efficiency​

**Note:** 
**Location:** Page: 273


---
> ​Very complex tasks,​

**Note:** 
**Location:** Page: 273


---
> ​classification​

**Note:** 
**Location:** Page: 274


---
> ​common practice​

**Note:** 
**Location:** Page: 274


---
> ​dropout,​

**Note:** 
**Location:** Page: 274


---
> ​early stopping​

**Note:** 
**Location:** Page: 274


---
> ​fewer and fewer neurons at each layer​

**Note:** 
**Location:** Page: 274


---
> ​form a funnel,​

**Note:** 
**Location:** Page: 274


---
> ​Gradient Descent does not get stuck as much on plateaus,​

**Note:** 
**Location:** Page: 274


---
> ​increasing the number of layers than the number of neurons per layer.​

**Note:** 
**Location:** Page: 274


---
> ​In most cases you can use the ReLU​

**Note:** 
**Location:** Page: 274


---
> ​more layers and neurons than you actually need,​

**Note:** 
**Location:** Page: 274


---
> ​not as common now,​

**Note:** 
**Location:** Page: 274


---
> ​not mutually exclusive​

**Note:** 
**Location:** Page: 274


---
> ​simpler approach​

**Note:** 
**Location:** Page: 274


---
> ​softmax activation function is generally a good​

**Note:** 
**Location:** Page: 274


---
> ​two classes),​

**Note:** 
**Location:** Page: 274


---
> ​use the same size for all hidden layers​

**Note:** 
**Location:** Page: 274


---
> ​when​

**Note:** 
**Location:** Page: 274


---
> ​you generally want to use the logistic function.​

**Note:** 
**Location:** Page: 274


---
> ​add noise to the inputs​

**Note:** 
**Location:** Page: 419


---
> ​capable of randomly generating new data​

**Note:** 
**Location:** Page: 419


---
> ​codings,​

**Note:** 
**Location:** Page: 419


---
> ​constraining the network​

**Note:** 
**Location:** Page: 419


---
> ​generative model.​

**Note:** 
**Location:** Page: 419


---
> ​limit the size of the internal representation,​

**Note:** 
**Location:** Page: 419


---
> ​prevent the autoencoder from trivially copying​

**Note:** 
**Location:** Page: 419


---
> ​recover the original​

**Note:** 
**Location:** Page: 419


---
> ​representations of the input​

**Note:** 
**Location:** Page: 419


---
> ​unsupervised pretraining of deep neural networks​

**Note:** 
**Location:** Page: 419


---
> ​useful for dimensionality reduction​

**Note:** 
**Location:** Page: 419


---
> ​work by simply learning to copy their inputs to their outputs.​

**Note:** 
**Location:** Page: 419


---
> ​decoder​

**Note:** 
**Location:** Page: 420


---
> ​encoder​

**Note:** 
**Location:** Page: 420


---
> ​generative network)​

**Note:** 
**Location:** Page: 420


---
> ​hailstone sequence).​

**Note:** 
**Location:** Page: 420


---
> ​recognition network)​

**Note:** 
**Location:** Page: 420


---
> ​cannot trivially copy​

**Note:** 
**Location:** Page: 421


---
> ​ends up performing Principal Component Analysis​

**Note:** 
**Location:** Page: 421


---
> ​forced to learn​

**Note:** 
**Location:** Page: 421


---
> ​internal representation has a lower dimensionality than the input data (it​

**Note:** 
**Location:** Page: 421


---
> ​only linear activations​

**Note:** 
**Location:** Page: 421


---
> ​reconstructions​

**Note:** 
**Location:** Page: 421


---
> ​undercomplete.​

**Note:** 
**Location:** Page: 421


---
> ​deep autoencoders).​

**Note:** 
**Location:** Page: 423


---
> ​multiple hidden layers.​

**Note:** 
**Location:** Page: 423


---
> ​one must be careful not to make the autoencoder too powerful.​

**Note:** 
**Location:** Page: 423


---
> ​stacked autoencoders​

**Note:** 
**Location:** Page: 423


---
> ​typically symmetrical with regards to the central hidden layer​

**Note:** 
**Location:** Page: 423


---
> ​easier to just define the layers manually.​

**Note:** 
**Location:** Page: 425


---
> ​tie the weights of the decoder layers to the weights of the encoder layers.​

**Note:** 
**Location:** Page: 425


---
> ​first autoencoder​

**Note:** 
**Location:** Page: 426


---
> ​first phase​

**Note:** 
**Location:** Page: 426


---
> ​much faster to train one shallow autoencoder at a time,​

**Note:** 
**Location:** Page: 426


---
> ​reconstruct the inputs.​

**Note:** 
**Location:** Page: 426


---
> ​reconstruct the output of the first autoencoder’s hidden layer.​

**Note:** 
**Location:** Page: 426


---
> ​second autoencoder​

**Note:** 
**Location:** Page: 426


---
> ​second phase,​

**Note:** 
**Location:** Page: 426


---
> ​simplest approach​

**Note:** 
**Location:** Page: 426


---
> ​use a different TensorFlow graph for each phase.​

**Note:** 
**Location:** Page: 426


---
> ​Another approach​

**Note:** 
**Location:** Page: 427


---
> ​simply copy the weights and biases from each autoencoder​

**Note:** 
**Location:** Page: 427


---
> ​single graph​

**Note:** 
**Location:** Page: 427


---
> ​add noise to its inputs, training it to recover the original, noise-free inputs.​

**Note:** 
**Location:** Page: 432


---
> ​coding layer to be just as large as the inputs, or even larger,​

**Note:** 
**Location:** Page: 432


---
> ​Gaussian​

**Note:** 
**Location:** Page: 432


---
> ​just train an autoencoder using all the training data, then reuse its encoder layers to create a new neural network​

**Note:** 
**Location:** Page: 432


---
> ​or​

**Note:** 
**Location:** Page: 432


---
> ​other kinds of constraints​

**Note:** 
**Location:** Page: 432


---
> ​overcomplete autoencoder.​

**Note:** 
**Location:** Page: 432


---
> ​randomly switched off inputs,​

**Note:** 
**Location:** Page: 432


---
> ​stacked denoising autoencoders.​

**Note:** 
**Location:** Page: 432


---
> ​dropout version, which is more common,​

**Note:** 
**Location:** Page: 433


---
> ​tf.shape(X),​

**Note:** 
**Location:** Page: 433


---
> ​adding an appropriate term to the cost function,​

**Note:** 
**Location:** Page: 434


---
> ​average activation of each neuron in the coding layer,​

**Note:** 
**Location:** Page: 434


---
> ​Kullback–Leibler divergence​

**Note:** 
**Location:** Page: 434


---
> ​layer at each training iteration.​

**Note:** 
**Location:** Page: 434


---
> ​measure​

**Note:** 
**Location:** Page: 434


---
> ​only 5% significantly active neurons in the coding layer.​

**Note:** 
**Location:** Page: 434


---
> ​penalize the neurons that are too active​

**Note:** 
**Location:** Page: 434


---
> ​sparsity​

**Note:** 
**Location:** Page: 434


---
> ​sparsity loss​

**Note:** 
**Location:** Page: 434


---
> ​actual probability​

**Note:** 
**Location:** Page: 435


---
> ​KL divergence between the target sparsity p and the actual sparsity q​

**Note:** 
**Location:** Page: 435


---
> ​p​

**Note:** 
**Location:** Page: 435


---
> ​P​

**Note:** 
**Location:** Page: 435


---
> ​q​

**Note:** 
**Location:** Page: 435


---
> ​Q,​

**Note:** 
**Location:** Page: 435


---
> ​target probability​

**Note:** 
**Location:** Page: 435


---
> ​activations of the coding layer must be between 0 and 1​

**Note:** 
**Location:** Page: 436


---
> ​sigmoid_cross_entropy_with_logits()​

**Note:** 
**Location:** Page: 436


---
> ​speed up convergence:​

**Note:** 
**Location:** Page: 436


---
> ​use the logistic activation function for the coding layer:​

**Note:** 
**Location:** Page: 436


---
> ​easier to train and the sampling process is much faster​

**Note:** 
**Location:** Page: 437


---
> ​encoder produces a mean coding​

**Note:** 
**Location:** Page: 437


---
> ​even after training​

**Note:** 
**Location:** Page: 437


---
> ​generative​

**Note:** 
**Location:** Page: 437


---
> ​one of the most popular​

**Note:** 
**Location:** Page: 437


---
> ​outputs are partly determined by chance,​

**Note:** 
**Location:** Page: 437


---
> ​probabilistic​

**Note:** 
**Location:** Page: 437


---
> ​sampled randomly from a Gaussian​

**Note:** 
**Location:** Page: 437


---
> ​similar to RBMs​

**Note:** 
**Location:** Page: 437


---
> ​standard deviation​

**Note:** 
**Location:** Page: 437


---
> ​variational autoencoders.​

**Note:** 
**Location:** Page: 437


---
> ​μ​

**Note:** 
**Location:** Page: 437


---
> ​σ.​

**Note:** 
**Location:** Page: 437


---
> ​actual distribution of the codings.​

**Note:** 
**Location:** Page: 438


---
> ​coding space​

**Note:** 
**Location:** Page: 438


---
> ​cost function.​

**Note:** 
**Location:** Page: 438


---
> ​KL divergence​

**Note:** 
**Location:** Page: 438


---
> ​latent​

**Note:** 
**Location:** Page: 438


---
> ​latent space)​

**Note:** 
**Location:** Page: 438


---
> ​loss​

**Note:** 
**Location:** Page: 438


---
> ​reconstruction loss​

**Note:** 
**Location:** Page: 438


---
> ​target distribution​

**Note:** 
**Location:** Page: 438


---
> ​two parts.​

**Note:** 
**Location:** Page: 438


---
> ​common variant is​

**Note:** 
**Location:** Page: 439


---
> ​train the encoder to output γ = log(σ2)​

**Note:** 
**Location:** Page: 439


---
> ​Contractive autoencoder (CAE)8​

**Note:** 
**Location:** Page: 441


---
> ​derivatives of the codings with regards to the inputs are small.​

**Note:** 
**Location:** Page: 441


---
> ​somewhat overshadowed unsupervised learning,​

**Note:** 
**Location:** Page: 441


---
> ​added capability to generate data.​

**Note:** 
**Location:** Page: 442


---
> ​competition leads to increasingly realistic fake data,​

**Note:** 
**Location:** Page: 442


---
> ​convolutional layers.​

**Note:** 
**Location:** Page: 442


---
> ​“discriminator,”​

**Note:** 
**Location:** Page: 442


---
> ​Generative Adversarial Network (GAN)12​

**Note:** 
**Location:** Page: 442


---
> ​Generative stochastic network (GSN)10​

**Note:** 
**Location:** Page: 442


---
> ​“generator.”​

**Note:** 
**Location:** Page: 442


---
> ​only the top k% activations for each neuron​

**Note:** 
**Location:** Page: 442


---
> ​similar inputs must have similar codings.​

**Note:** 
**Location:** Page: 442


---
> ​sparse convolutional​

**Note:** 
**Location:** Page: 442


---
> ​Stacked convolutional autoencoders9​

**Note:** 
**Location:** Page: 442


---
> ​Winner-take-all (WTA) autoencoder11​

**Note:** 
**Location:** Page: 442
