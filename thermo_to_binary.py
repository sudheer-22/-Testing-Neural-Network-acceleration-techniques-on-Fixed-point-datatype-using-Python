import numpy as np
import time
import math
o = int(input("Enter the decimal number of decimal points: "))
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

def matmul(test, test2):
  n_bits = 6
  f = (1 << n_bits)
  j = test2.shape
  out = np.zeros(j[1], )
  for i in range(j[1]):
    var = 0
    for h in range(j[0]):
      b = test[h]*test2[h][i]
      var += np.round(b*f)*(1.0/f)
      var = np.round(var*f)*(1.0/f)
    out[i] = var
  return out 


def stochastic_rounding(vector):
  for i in range(vector.size):
    if vector[i] >= 31.75:
      vector[i] = 31.75
    elif vector[i] <= -31.75:
      vector[i] =  -31.75
    else:
      vector[i] = vector[i]
  return vector

training_data = np.array([[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
                          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1],
                          [0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1],
                          [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1],
                          [0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1],
                          [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1],
                          [0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1],
                          [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1],
                          [0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1],
                          [0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1],
                          [0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1],
                          [0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1],
                          [0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1],
                          [0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
                          [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
                          [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]])
training_output = np.array([[0,0,0,0],
                            [0,0,0,1],
                            [0,0,1,0],
                            [0,0,1,1],
                            [0,1,0,0],
                            [0,1,0,1],
                            [0,1,1,0],
                            [0,1,1,1],
                            [1,0,0,0],
                            [1,0,0,1],
                            [1,0,1,0],
                            [1,0,1,1],
                            [1,1,0,0],
                            [1,1,0,1],
                            [1,1,1,0],
                            [1,1,1,1]])
weights = np.array([[-1.26240457,  1.27924867,  0.10438059,  1.55439999],
 [ 1.32186035,  1.28265441,  0.77106099, -0.54432407],
 [ 0.04733965,  1.56998947, -0.44120324,  0.2137264 ],
 [ 1.10186486, -0.60257865,  0.22103611,  3.13296552],
 [-1.25886134, -0.36808143, -0.81578352,  0.51919261],
 [-0.93676327,  1.47910488, -0.75210235,  1.06489674],
 [ 0.46459787, -1.71717278, -1.95347219,  1.43568598],
 [ 0.17007873,  0.24079698,  1.45122778, -1.48019023],
 [-0.72692395,  0.3456879,  -2.14604943,  1.10831153],
 [-0.7444553,  -1.78192185,  0.55240797, -0.23317283],
 [ 0.00972219, -1.33759483, -1.55423772,  0.76777412],
 [-0.10636752,  1.13221399, -0.43390582,  1.11523408],
 [-1.39620193,  0.04296982,  2.09695784,  3.35524574],
 [-0.05725745, -1.08210307, -2.64168381,  0.38655571],
 [ 1.31301556,  0.76531272, -0.69710303,  0.35288906],
 [-0.44730519, -0.44194338,  1.61093914, -0.22549929]])
#print(weights, bias)
bias = np.array([ 1.21894838,  1.16875496, -1.18650167,  0.59923186])
weights = array_conversion(weights, o)
bias = vector_conversion(bias, o)
#print(weights, bias)
lr = 0.5
def perceptron(input_pass, output_pass, count_pass):
    n_bits = 6
    f = (1 << n_bits)
    outputT = matmul(input_pass,weights)+bias
    outputT = vector_conversion(outputT, n_bits)
    outputT = stochastic_rounding(outputT)
    #outputT = 1/(1 + np.exp(-outputT))
    #outputT = stochastic_rounding(outputT)
    #outputT = vector_conversion(outputT, n_bits)
    #outputT = np.tanh(outputT)
    #outputT = stochastic_rounding(outputT)
    outputT = vector_conversion(outputT, n_bits)
    outputT = stochastic_rounding(outputT)
    outputT = np.heaviside(outputT, 0)
    outputT = np.reshape(outputT, (4,))

    if np.array_equal(outputT, output_pass):
      count_pass = count_pass+1
    #print(outputT, output_pass)
    error = outputT - output_pass
    for j in range(4):
      for k in range(16):
        weights[k][j] -= np.round((input_pass[k]*error[j]*lr)*f)*(1.0/f)
        weights[k][j] = np.round(weights[k][j]*f)*(1.0/f)
    bias[j] = np.round((bias[j]*lr*error[j])*f)*(1.0/f)
    bias[j] = np.round(bias[j]*f)*(1.0/f)  
    return count_pass
#training--------------------------------------------------------------------------------	
for s in range(1000):
  count = 0
  for v in range(16):
    count = perceptron(training_data[v], training_output[v], count)
  accuracy = (count/16)*100
  print("Training accuracy of",s+1,"th epoch:",accuracy)
  if accuracy == 100.0:
    break  

weights = array_conversion(weights, o)
bias = vector_conversion(bias, o)
#testing------------------------------------------------------------------------------------
for r in range(16):
  outputX = np.matmul(training_data[r],weights)+bias
  outputX = vector_conversion(outputX, 0)
  outputT = stochastic_rounding(outputX)
  #print(outputX)
  #outputX = 1/(1 + np.exp(-outputX))
  #outputT = stochastic_rounding(outputX)
  #outputT = vector_conversion(outputX, o)
  #outputX = np.tanh(outputX)
  #outputT = stochastic_rounding(outputX)
  outputT = vector_conversion(outputX, o)
  outputX = np.heaviside(outputX,0)
  outputX = np.reshape(outputX, (4,))
  print(outputX)
  
print(outputX.dtype)
print('weights', weights)
print('bias', bias)
  
  
#No:of epochs required are 31 when 1 signbit, 1 bit-integral part, 6 bits for fractional.

#No:of epochs required are 22 when 1 signbit, 2 bit-integral part, 5 bits for fractional parts were assigned.

#No:of epochs required are 33 when 1 signbit, 3 bit-integral part, 4 bits for fractional.

#No:of epochs required are 26 when 1 signbit, 4 bit-integral part, 3 bits for fractional.

#No:of epochs required are 29 when 1 signbit, 5 bit-integral part, 2 bits for fractional.

#No:of epochs required are 31 when 1 signbit, 6 bit-integral part, 1 bits for fractional.