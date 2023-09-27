package nl.gall.reflex.performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.scenario.Simulation
import io.gatling.core.structure.ScenarioBuilder

import scala.concurrent.duration.DurationInt
import scala.language.postfixOps

class TestReceivingSimulation extends Simulation{
  val receiving: ScenarioBuilder = scenario("Receiving").exec(karateFeature("classpath:nl/gall/reflex/features/Receiving.feature"))

  setUp(receiving.inject(rampUsers(4)during(5 seconds)))
  
}
