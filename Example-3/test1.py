def function1(obj):                   #flattening the dictionary
    for key, value in obj.items():
        if type(value) is dict:
            yield (key, value)
            yield from function1(value)
        else:
            yield (key, value)

def function2(x,obj1):                    #finding key in the flattened dictionary
    for key, value in function1(obj1):
        if key == x:
          print(value)


object = {"a":{"b":{"c":"d"}}}
function2("a",object)
function2("b",object)
function2("c",object)
