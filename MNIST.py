import numpy as np
import math
import cv2
def vector_conversion(matrix2, w):
  h = matrix2.shape
  for z in range(h[0]):
    matrix2[z] = decimal_to_binary(matrix2[z],w)
  return matrix2 
def array_conversion(matrix, j):
  h = matrix.shape
  for z in range(h[0]):
    for p in range(h[1]):
      matrix[z][p] = decimal_to_binary(matrix[z][p],j)
  return matrix 
def decimal_to_binary(a, m):
  array = np.zeros(m)
  number = math.modf(a)
  fract = number[0]
  #print(fract)
  #print(number[1])
  for i in range(m):
    fract = fract*2
    #print(fract)
    y = math.modf(fract)
    #print(y)
    array[i] = y[1]
    fract = y[0]
  #print(array)
    #print(fract)
  #print(array)
  x = 1/2
  fract = 0
  for s in range(m):
    #print(array[s])
    fract += array[s]*x
    x = x/2
    #print(fract)
  return number[1]+fract
def mult(a, b):
  a = decimal_to_binary(a, 5)
  b = decimal_to_binary(b, 5)
  res = a*b
  res = decimal_to_binary(res, 5)
  return res
def matmul(matrix1, matrix2):
  print("yes")
  n_bits = 5
  f = (1 << n_bits)
  matrix1 = np.array(matrix1)
  matrix2 = np.array(matrix2)
  if matrix1.ndim == 1:
    matrix1 = matrix1.reshape(1, matrix1.size)
  result = np.zeros([matrix1.shape[0], matrix2.shape[1]])
  for i in range(len(matrix1)): 
    for j in range(len(matrix2[0])): 
        for k in range(len(matrix2)): 
            result[i][j] += mult(matrix1[i][k], matrix2[k][j])
            result[i][j] = decimal_to_binary(result[i][j], 5)
  return result
class Layer:
    def __init__(self):
        """Here you can initialize layer parameters (if any) and auxiliary stuff."""
        # A dummy layer does nothing
        self.weights = np.zeros(shape=(input.shape[1], 10))
        bias = np.zeros(shape=(10,))
        pass
    
    def forward(self, input):
        """
        Takes input data of shape [batch, input_units], returns output data [batch, 10]
        """
        output = np.matmul(input, self.weights) + bias
        return output
		
		
class Dense(Layer):
    def __init__(self, input_units, output_units, learning_rate=0.1):
        self.learning_rate = decimal_to_binary(learning_rate, 5)
        
        # initialize weights with small random numbers. We use normal initialization
        self.weights = np.random.randn(input_units, output_units)*0.01
        self.biases = np.zeros(output_units)
        self.weights = array_conversion(self.weights, 5)
    def forward(self,input):
      x = matmul(input, self.weights) + self.biases
      print()
      if x.ndim == 1:
        x = vector_conversion(x, 5)
      else:
        x = array_conversion(x, 5)
      return x
      
    def backward(self,input,grad_output):
        print("started")
        # compute d f / d x = d f / d dense * d dense / d x
        # where d dense/ d x = weights transposed
        grad_input = matmul(grad_output,np.transpose(self.weights))
        # compute gradient w.r.t. weights and biases
        grad_weights = np.transpose(matmul(np.transpose(grad_output),input))
        grad_weights = array_conversion(grad_weights, 5)
        grad_biases = np.sum(grad_output, axis = 0)
        grad_biases = vector_conversion(grad_biases, 5)
        # Here we perform a stochastic gradient descent step. 
        # Later on, you can try replacing that with something better.
        self.weights = self.weights - array_conversion(self.learning_rate * grad_weights, 5)
        self.weights = array_conversion(self.weights, 5)
        self.biases = self.biases - vector_conversion(self.learning_rate * grad_biases, 5)
        self.biases = vector_conversion(self.biases, 5)
        return grad_input

class ReLU(Layer):
    def __init__(self):
        """ReLU layer simply applies elementwise rectified linear unit to all inputs"""
        pass
    
    def forward(self, input):
        """Apply elementwise ReLU to [batch, input_units] matrix"""
        return np.maximum(0,input)

    def backward(self, input, grad_output):
        """Compute gradient of loss w.r.t. ReLU input"""
        relu_grad = input > 0
        c = grad_output*relu_grad
        if c.ndim == 1:
          c = vector_conversion(c, 5)
        else:
          c = array_conversion(c, 5)
        return c

def softmax_crossentropy_with_logits(logits,reference_answers):
    """Compute crossentropy from logits[batch,n_classes] and ids of correct answers"""
    logits_for_answers = logits[np.arange(len(logits)),reference_answers]
    
    xentropy = - logits_for_answers + np.log(np.sum(np.exp(logits),axis=-1))
    
    return xentropy

def grad_softmax_crossentropy_with_logits(logits,reference_answers):
    """Compute crossentropy gradient from logits[batch,n_classes] and ids of correct answers"""
    ones_for_answers = np.zeros_like(logits)
    ones_for_answers[np.arange(len(logits)),reference_answers] = 1
    exp = np.exp(logits)
    if exp.ndim == 1:
      exp = vector_conversion(exp, 5)
    else:
      exp = array_conversion(exp, 5)
    sumExp = exp.sum(axis=-1,keepdims=True)
    if sumExp.ndim == 1:
      sumExp = vector_conversion(sumExp, 5)
    else:
      sumExp = array_conversion(sumExp, 5)
    #softmax = np.exp(logits) / np.exp(logits).sum(axis=-1,keepdims=True)
    softmax = exp/sumExp
    return (- ones_for_answers + softmax) / logits.shape[0]
  
# Import Dataset
import keras
def load_dataset(flatten=False):
    (X_train, y_train), (X_test, y_test) = keras.datasets.mnist.load_data()
    #X_train = np.zeros((60000, 14, 14))
    #X_test = np.zeros((10000, 14, 14))
    #t = 14/28
   # for i in range(X_train1.shape[0]):
    #    X_train[i] = cv2.resize(X_train1[i], None, fx = t, fy = t)
    #    if i < 10000:
     #       X_test[i] = cv2.resize(X_test1[i], None, fx = t, fy = t)
    # normalize x
    X_train = X_train.astype(float) / 255.
    X_test = X_test.astype(float) / 255.

    # we reserve the last 10000 training examples for validation
    X_train, X_val = X_train[:-10000], X_train[-10000:]
    y_train, y_val = y_train[:-10000], y_train[-10000:]

    if flatten:
        X_train = X_train.reshape([X_train.shape[0], -1])
        X_val = X_val.reshape([X_val.shape[0], -1])
        X_test = X_test.reshape([X_test.shape[0], -1])

    return X_train, y_train, X_val, y_val, X_test, y_test
  
import matplotlib.pyplot as plt
X_train, y_train, X_val, y_val, X_test, y_test = load_dataset(flatten=True)

network = []
network.append(Dense(X_train.shape[1],100))
network.append(ReLU())
network.append(Dense(100,200))
network.append(ReLU())
network.append(Dense(200,10))

def forward(network, X):
    """
    Compute activations of all network layers by applying them sequentially.
    Return a list of activations for each layer. 
    Make sure last activation corresponds to network logits.
    """
    activations = []
    input = X
    for i in range(len(network)):
        activations.append(network[i].forward(X))
        X = network[i].forward(X)
        
    assert len(activations) == len(network)
    return activations

def predict(network,X):
    """
    Compute network predictions.
    """
    logits = forward(network,X)[-1]
    return logits.argmax(axis=-1)

def train(network,X,y):
    """
    Train your network on a given batch of X and y.
    You first need to run forward to get all layer activations.
    Then you can run layer.backward going from last to first layer.
    After you called backward for all layers, all Dense layers have already made one gradient step.
    """
    
    # Get the layer activations
    layer_activations = forward(network,X)
    logits = layer_activations[-1]
    
    # Compute the loss and the initial gradient
    loss = softmax_crossentropy_with_logits(logits,y)
    loss_grad = grad_softmax_crossentropy_with_logits(logits,y)
    
    for i in range(1, len(network)):
        loss_grad = network[len(network) - i].backward(layer_activations[len(network) - i - 1], loss_grad)
    #loss_grad = network[0].backward(X, loss_grad)
    return np.mean(loss)
  
from tqdm import trange
def iterate_minibatches(inputs, targets, batchsize, shuffle=False):
    assert len(inputs) == len(targets)
    if shuffle:
        indices = np.random.permutation(len(inputs))
    for start_idx in trange(0, len(inputs) - batchsize + 1, batchsize):
        if shuffle:
            excerpt = indices[start_idx:start_idx + batchsize]
        else:
            excerpt = slice(start_idx, start_idx + batchsize)
        yield inputs[excerpt], targets[excerpt]
        
train_log = []
val_log = []
for epoch in range(25):

    for x_batch,y_batch in iterate_minibatches(X_train,y_train,batchsize=32,shuffle=True):
        train(network,x_batch,y_batch)
        
    
    train_log.append(np.mean(predict(network,X_train)==y_train))
    val_log.append(np.mean(predict(network,X_val)==y_val))
    
    #clear_output()
    print("Epoch",epoch)
    print("Train accuracy:",train_log[-1])
    print("epoch", epoch)
    print("Val accuracy:",val_log[-1])
    plt.plot(train_log,label='train accuracy')
    plt.plot(val_log,label='val accuracy')
    plt.legend(loc='best')
    plt.grid()
    plt.show()