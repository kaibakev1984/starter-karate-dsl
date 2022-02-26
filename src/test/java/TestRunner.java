import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestRunner {
    private static final String CLASSPATH = "classpath:petstore/features/";
    private static final String TAGS = "~@ignore";
    private static final boolean OUTPUT_CUCUMBER_JSON = true;
    private static final int THREAD_COUNT = 1;

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    @Test
    public void TestSuite() {
        Results results =
                Runner.path(CLASSPATH).outputCucumberJson(OUTPUT_CUCUMBER_JSON).tags(TAGS).parallel(THREAD_COUNT);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    private static void generateReport(String output) {
        String pathname = "target/maven-cucumber-report";
        String projectName = "karate-services";
        Collection<File> jsonFiles = FileUtils.listFiles(new File(output), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File(pathname), projectName);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
