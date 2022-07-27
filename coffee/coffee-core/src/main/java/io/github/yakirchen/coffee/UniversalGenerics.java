package io.github.yakirchen.coffee;

import java.util.HashMap;
import java.util.HashSet;

/**
 * UniversalGenerics
 *
 * @author yakir on 2022/06/20 15:45.
 */
public class UniversalGenerics<T> {

    public static void main(String[] args) {

        var map_0 = new HashMap<String, Integer>();
        map_0.put("a", 1);
        System.out.println(map_0.containsKey("a"));

        var set_0 = new HashSet<Integer>();
        set_0.add(1);
        System.out.println(set_0.contains(1));
    }
}
