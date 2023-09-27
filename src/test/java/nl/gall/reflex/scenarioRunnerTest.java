package nl.gall.reflex;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
// import com.intuit.karate.junit5.Karate;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import static org.junit.jupiter.api.Assertions.assertTrue;


class scenarioRunnerTest {

        @Test
        void testparallel() {
 //               Results results = Runner.path("classpath:examples")
                        //.outputCucumberJson(true)
 //                       .parallel(5);
 //               assertEquals(0, results.getFailCount(), results.getErrorMessages());

                Results results = Runner.path("classpath:nl/gall/reflex/features/")
                  .outputCucumberJson(true)//.path("target/cucumber-reports")
                  .tags("~@ignore").parallel(5);
                generateReport(results.getReportDir());
                assertTrue(results.getFailCount() == 0, results.getErrorMessages());

}
        public static void generateReport(String karateOutputPath) {
                Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
                List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
                jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
                Configuration config = new Configuration(new File("target"), "demo");
                ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
                reportBuilder.generateReports();
        }

}

// public class UsersRunner {
// @Karate.Test
// Karate testUsers() {
// return Karate.run(„users“).relativeTo(getClass());
// }
// }