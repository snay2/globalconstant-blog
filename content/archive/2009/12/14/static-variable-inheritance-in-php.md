+++
title = "Static variable inheritance in PHP"
slug = "static-variable-inheritance-in-php"
url = "/2009/12/14/static-variable-inheritance-in-php"
date = "2009-12-14T15:46:46.000Z"
+++

In version 5.1 of PHP, classes can override static variables. But there are a few kinks.

To start off, here's the code I used to make this work:

<strong>ParentClass.php</strong>

    class ParentClass {
        static $something = "I'm in the parent class";

        static function getSomething() {
            return self::$something;
        }
    }

<strong>Child1.php</strong>

    class Child1 extends ParentClass {
    }
    

<strong>Child2.php</strong>

    class Child2 extends ParentClass {
        static $something = "I'm in the child class";
    }

<strong>Child3.php</strong>

    class Child3 extends ParentClass {
        static $something = "I'm in the child class";

        static function getSomething() {
            return self::$something;
        }
    }

<strong>test.php</strong>

    require_once('ParentClass.php');
    require_once('Child1.php');
    require_once('Child2.php');

    echo "Parent class: ";
    echo ParentClass::$something;

    echo "&lt;br /&gt;Child1 class (no overriding): ";
    echo Child1::$something;

    echo "&lt;br /&gt;Child2 class (overrides static var): ";
    echo Child2::$something;

    echo "&lt;br /&gt;Child3 class (overrides static var): ";
    echo Child3::$something;

    echo "&lt;hr /&gt;&lt;br /&gt;Parent class: ";
    echo ParentClass::getSomething();

    echo "&lt;br /&gt;Using the method (Child1): ";
    echo Child1::getSomething();

    echo "&lt;br /&gt;Using the method (Child2): ";
    echo Child2::getSomething();

    echo "&lt;br /&gt;Using the method (Child3): ";
    echo Child3::getSomething();
    

Now here's the output when you run it:

    Parent class: I'm in the parent class
    Child1 class (no overriding): I'm in the parent class
    Child2 class (overrides static var): I'm in the child class
    Child3 class (overrides static var): I'm in the child class

---

    Parent class: I'm in the parent class
    Using the method (Child1): I'm in the parent class
    Using the method (Child2): I'm in the parent class
    Using the method (Child3): I'm in the child class

Let's analyze what's going on here. The ParentClass implements a static variable called $something and assigns it a value. Child1 doesn't override that but simply inherits it. Child2 and Child3 both override it to give it a different value. When we retrieve the value of that static variable directly from each class, we can see that it worked.

The tricky behavior is in the method. The ParentClass implements the static method that outputs $something. We call that method respectively from each class. What you'd expect is that it would output the value of the static variable as far down the inheritance line as the class from which it was called. But from the output it's apparent that <strong>the value of self::$something depends only on the class where the method was actually implemented, not the class from which it was called</strong>.
