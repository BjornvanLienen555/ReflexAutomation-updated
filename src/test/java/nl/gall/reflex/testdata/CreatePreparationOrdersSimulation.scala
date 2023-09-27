package nl.gall.reflex.testdata

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.scenario.Simulation
import io.gatling.core.structure.ScenarioBuilder
// used for specifying durations with a unit, eg "5 minutes"
import scala.concurrent.duration._

import scala.concurrent.duration._
import scala.language.postfixOps

class CreatePreparationOrdersSimulation extends Simulation{
  val receiving: ScenarioBuilder = scenario("Create PROs").repeat(20){
    exec(karateFeature("classpath:nl/gall/reflex/features/CreatePreparationOrders_for_PT.feature"))
  }


/*  setUp(receiving.inject(constantUsersPerSec(1).during(1 minutes)))
    .throttle(
      reachRps(2).in(10),
      holdFor(1.minute))*/

  setUp(receiving.inject(atOnceUsers(1)))
}
