# mental math quiz
# how many basic math problems can you do in 2 minutes?
# to install on ubuntu 21.10
# sudo apt install -y sagemath
# sagemath --notebook
# (copy link into browser)
# this will open a jupyter notebook in your browser
# On upper right in browser, select new/sagemath
# at sagemath notebook prompt, type
# load ("mentalMathQuiz.sage")
# type <Control> Enter 
# to evaluate the jupyter notebook cell
# select "+" to get a new notebook prompt
# in the new prompt, type
# answer( <your answer here>)
# you'll get a message evaluating your answer, then another question
# until 2 minutes have elapsed.
#
# 10 Feb 2022, 220210
#
from time import time
startTime = time()
startFlag = 1
score = 0
duration = 240 
questionValue = 10
correctAnswer = -1
var ('y')
def myMult():
     global questionValue
     questionValue = 2
     a = int(random() * 20)
     b = int(random() * 20)
     print( 'What is ' + str(a) + ' * ' + str(b) + '?  write your answer as answer(<number>)')
     return a*b

def myDeriv():
     global questionValue
     questionValue = 4 
     a = int(random() * 9)
     b = int(random() * 9)
     c = int(random() * 9)
     d = int(random() * 9)
     f(x) = a*x^b + c*x^d
     print( 'What is the derivative df/dx of the following function?  write your answer as answer(<formula>)')
     show(f)
     return derivative(f,x)

def myInt():
     global questionValue
     questionValue = 8 
     a = int(random() * 9)
     b = int(random() * 9)
     f(x) = a*x^b
     print( 'What is the indefinite integral dx of the following function?  write your answer as answer(<formula>)')
     show(f)
     return integrate(f,x)

def myFrac():
     global questionValue
     questionValue = 4 
     a = int(random() * 9)
     b = int(random() * 8) + 1
     c = int(random() * 9)
     d = int(random() * 8) + 1
     print( 'What is ' + str(a) + '/' + str(b) + '+' + str(c) + '/' + str(d) + '?  write your answer as answer(<formula>)')
     return a/b + c/d

def myIntercept():
     global questionValue
     questionValue = 30 
     a = int(random() * 2) + 1
     b = int(random() * 5) + 1
     c = int(random() * 3) 
     d = int(random() * 5) + 1
     f(x) = x^a + b
     g(x) = x^c + d
     solutions = solve (f == g, x, solution_dict=True)
     print( 'What are the intercept(s) of the two functions below?  write your answer as, e.g, answer([{x:0},{x:1}] or answer([]))')
     show(f)
     show(g)
     p1 = plot(f, (x, -1, 3), color='blue', axes_labels=['x', 'y'])
     p2 = plot(g, (x, -1, 3), color='red')
     show(p1+p2)
     return solutions

def mySimultaneousEquations():
     global questionValue
     questionValue = 20 
     a = int(random() * 10)
     b = int(random() * 10) 
     c = int(random() * 2) 
     if c <1: c= -1
     d = int(random() * 7) - 3 
     e = int(random() * 7) - 3 
     f = int(random() * 2)
     if f<1: f= -1
     rhs1=c*a + d*b
     rhs2=e*a + f*b
     print( 'Solve [' + str(c) + '*x + ' + str(d) + '*y==' + str(rhs1) + ',' + str(e) + '*x + ' + str(f) + '*y==' + str(rhs2) + ']')
     print( 'Write your answer in the form, e.g., answer([{x: 5}, {y: 3})')
     return [{x: a}, {y: b}] 

def myFunction():
     global questionValue
     questionValue = 20 
     a = int(random() * 2) + 1
     b = int(random() * 2) + 1
     c = int(random() * 5) - 2
     d = int(random() * 5)
     options = {0: a*x^b+c,
                1: a*sin(x)+b,
                2: a*cos(x)+b,
                3: a*exp(x)+c,
                4: a*x^2+b*x,
                }
     f(x)=options[d]()
     p1=plot(f, (0,5))
     show(p1)
     for i in range(5):
          print( 'f(' + str(i) + ')=' + str(RR(f(i))))
     print( 'Determine the function by looking at the plot above.  Write your answer as answer(<formula>)')
     return f 

def myMatrix():
     global questionValue
     questionValue = 20 
     a = int(random() * 10)
     b = int(random() * 10)
     c = int(random() * 10)
     d = int(random() * 10)
     e = int(random() * 2)
     f = int(random() * 10)
     A = Matrix([[a*x^e+f,b],[c,d]])
     print( 'Calculate the determinant of the matrix below; report your answer as answer(<formula>)')
     show(A)
     return det(A) 

def answer(userAnswer):
     global correctAnswer, score, questionValue, startFlag
     if startFlag == 1: 
          startFlag = 0
     else:
          if correctAnswer == userAnswer:
               score = score + questionValue
               print( 'Correct!')
          else:
               print( 'Incorrect, answer was ' + str(correctAnswer))
     options = {0: myMatrix,
                1: myDeriv,
                2: myInt,
                3: myFrac,
                4: mySimultaneousEquations, 
                5: myIntercept,
                6: myMult, 
                7: myFunction,
                }
          
     if (time() - startTime) < duration:
                correctAnswer = options[ int(random() * 8 )]() 
     else:
                print( str(duration) + ' seconds have elapsed.  Your score is ' + str(score))
     return 

answer(0)
