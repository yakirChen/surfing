package io.github.yakirchen.coffee.jmh;

import io.github.yakirchen.coffee.ThreadVirtual;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;
import org.openjdk.jmh.results.format.ResultFormatType;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import static org.openjdk.jmh.annotations.Mode.AverageTime;
import static org.openjdk.jmh.annotations.Mode.SampleTime;
import static org.openjdk.jmh.annotations.Mode.SingleShotTime;
import static org.openjdk.jmh.annotations.Mode.Throughput;

/**
 * ThreadVirtualBenchmark
 * <p>
 * <a href="https://jmh.morethan.io/">JMH Visualizer</a>
 * <a href="http://deepoove.com/jmh-visual-chart/">JMH Visual Chart</a>
 *
 * @author yakir on 2022/06/20 17:27.
 */
@State(Scope.Benchmark)
@Warmup
@Measurement
@BenchmarkMode({Throughput, AverageTime, SampleTime, SingleShotTime})
@Fork(1)
public class ThreadVirtualBenchmark {

    private ThreadVirtual threadVirtual;

    @Setup(Level.Invocation)
    public void setup() {
        threadVirtual = new ThreadVirtual();
    }

    @Benchmark
    public void benchmark_vt() {
        var vtf = Thread.ofVirtual()
                .name("VTF")
                .factory();
        threadVirtual.forEach(10, vtf);
    }

    @Benchmark
    public void benchmark_pt() {
        var ptf = Thread.ofPlatform()
                .name("PTF")
                .factory();
        threadVirtual.forEach(10, ptf);
    }

    public static void main(String[] args) {
        new OptionsBuilder()
                .include(ThreadVirtualBenchmark.class.getSimpleName())
                .result("/Users/yakir/Developer/think/surfing/coffee/coffee-jmh/result.json")
                .resultFormat(ResultFormatType.JSON)
                .build();
    }
}
