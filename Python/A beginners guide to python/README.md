# 💻🐍 A beginners guide to Python by Henna Kultalahti

📚*To teach is the best way to learn*
          - Frank Oppenheimer

So here is my basic guide to Python.

## Different type of lines 

### String (str)
Str means text
It need to be inside " " or ' '
When used with print command it looks like this

````
text = "I like cats"
print(text)       # this prints the text we assigned above
print("I like cats") # you can also do it like this
````

### Numerical values (int, float)
It looks like this
````
integer = 5
decimal = 3.14
print(integer)  # 5
print(decimal)  # 3.14
````

### Mixing text and numbers with f, comma (,) and other ways

You can either do this 
````
print("The number is " + str(5))   # The number is 5
````
or this 
````
name = "Karri-kissa"
age = 12
print(f"Hello {name}, you are {age} years old.")
# Output: Hello Karri-kissa, you are 12 years old.
````
or use the comma ,
notice that this adds a space in between
````
name = "Karri"
age = 12

print("Name:", name, "Age:", age)

#Output Name: Karri Age: 12 
````

Example of two different ways:
When
````
x = 27
y = 15
````
What we want output to look like 
````
27 / 15 = 1.8
````

option one
````
print(f"{x} / {y} = {x / y}")
````
option two 
````
print(x, "/", y, "=", (x / y))
````

## 1️⃣2️⃣3️⃣ About them numbers 

Some important info about working with numbers:




## Commands

| Command  | What it does | Important |
| ------------- | ------------- |-------|
| print(" ")  | prints the wanted text  | print("text") vs print (2+2) and spaces in text|
| input(" ")  | gets info from user  |


