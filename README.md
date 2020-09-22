# Training a small neural network of 4 neurons to achieve better performance when implemented on hardware platforms
A small neural network containing a single layer(of 4 neurons) which takes 16-bit thermometer code as input and gives binary output corresponding to it has been trained to achieve better performance on hardware platforms. 9 bit fixedpoint datatye has been simulated in python by writing respective functions.Stochastic rounding is used inorder to decrease the word length required for the overall design.While training it has been found that atleat 3 bits for integral part, 5 bits for fractional part and 1bit for sign are required.Hence 9bit datatype has been chosen to execute this operation. Hardware implementation has been done using the 10-bit datatype. One additional bit is alloted to store the values obtained before stochastic rounding is executed.
Same methods has been tried on a three layer fully connected neural network that trains on MNIST data set. But due to complexity issues it is impractical to complete training using methods I followed.   
