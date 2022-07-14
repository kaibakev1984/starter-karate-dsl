import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestRunnerParallel {
  private static final String PETSTORE_PATH = "classpath:petstore";
  private static final String TALLER_KARATE_PATH = "classpath:taller_karate";

  @Test
  void testRunnerParallel() {
    Results results =
        Runner.path(TALLER_KARATE_PATH)
            .outputCucumberJson(true)
            // .tags("~@ignore")
            .parallel(1);
    generateReport(results.getReportDir());
    assertEquals(0, results.getFailCount(), results.getErrorMessages());
  }

  public static void generateReport(String karateOutputPath) {
    Collection<File> jsonFiles =
        FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
    List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
    jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    Configuration config = new Configuration(new File("target"), "starter-karate-dsl");
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    reportBuilder.generateReports();
  }
}
