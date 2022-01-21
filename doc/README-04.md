# 03-MyThirdJava

* object 物件

        Java 中的所有物件即是Object
        物件中定義的方法只要不是final 都可以被複寫
        @Override toString()

* tryncatch 例外處理

        擷取不正常發生的狀況 避免程式終止
        終止不正確的結果
        非程式撰寫導致的異常狀況
        將正常處理程序與錯誤處理程序分開

* array 陣列

        collection 介面
        動態陣列 
        add() / clear() / isEmpty() / size() / remove()

        List 串列
        有特定順序 有index 可以重複

        Set 集
        無特定順序 無index 不可重複

        Map 集合介面 映射表
        無繼承collection
        無特定順序 有index <key,value>
        key 不可重複 value可重複

* Lambda
        
        GetSimple 
        利用 Runnable Interface 實作
        Runnable runnable = () ->System.out.println("run");

        LambdaArray
        list.forEach(i -> System.out.println(i));
        List<>泛型

        LambdaStream
        將Array 轉成 stream 利用.map 轉至內容在使用collect 轉回list
