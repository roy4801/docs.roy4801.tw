# typeid and demangle

* typeid

```cpp
#include <typeinfo>
class Base {
public:
    virtual void vvfunc() {}
};

class Derived : public Base {};

template<typename T>
void hello()
{
    cout << "hello, " << typeid(T).name() << '\n';
}

int main() {
    cout << typeid(123).name() << '\n';
    cout << typeid(1.0).name() << '\n';
    
    Derived* pd = new Derived;
    Base* pb = pd;
    cout << typeid( pb ).name() << '\n';   //prints "P4Base"
    cout << typeid( *pb ).name() << '\n';  //prints "7Derived"
    cout << typeid( pd ).name() << '\n';   //prints "P7Derived"
    cout << typeid( *pd ).name() << '\n';  //prints "7Derived"
    
    int a;
    int &b = a;
    double c;
    if(typeid(a) == typeid(b))
        puts("type a == type b");
    if(typeid(a) != typeid(c))
        puts("type a != type c");
        
    hello<long long>();
}
```

* demangle

```cpp
#include <cxxabi.h>
int status = 0;
abi::__cxa_demangle(name, 0, 0, &status);
```

## References

<https://docs.microsoft.com/zh-tw/cpp/cpp/typeid-operator?view=vs-2019>
