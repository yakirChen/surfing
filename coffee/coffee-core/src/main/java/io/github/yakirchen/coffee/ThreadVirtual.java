package io.github.yakirchen.coffee;

import jdk.incubator.concurrent.StructuredTaskScope;

import java.util.concurrent.Future;
import java.util.concurrent.ThreadFactory;
import java.util.stream.IntStream;

/**
 * ThreadVirtual
 *
 * @author yakir
 */
public class ThreadVirtual {

    public static void main(String[] args) {

        long start = 0L;
        long end   = 0L;

        var vtf = Thread.ofVirtual()
                .name("VTF")
                .factory();
        var ptf = Thread.ofPlatform()
                .name("TF")
                .stackSize(10)
                .factory();

        start = System.nanoTime();
        new ThreadVirtual().forEach(10, vtf);
        end = System.nanoTime();
        System.out.println(end - start);

        start = System.nanoTime();
        new ThreadVirtual().forEach(10, ptf);
        end = System.nanoTime();
        System.out.println(end - start);
    }

    public void forEach(int end, ThreadFactory tf) {
        try (var taskScope = new StructuredTaskScope<String>("STS", tf)) {
            var result = IntStream.range(0, end)
                    .mapToObj(_int -> {
//                        System.out.printf("item = %d, Thread ID = %s\n", _int, Thread.currentThread());
                        return taskScope.fork(() -> {
//                            System.out.printf("\ttask = %d, Thread ID = %s\n", _int, Thread.currentThread());
                            return "task %d result".formatted(_int);
                        });
                    })
                    .toList();
            taskScope.join();
            var results = result.stream()
                    .map(Future::resultNow)
                    .toList();
//            System.out.println(results);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
