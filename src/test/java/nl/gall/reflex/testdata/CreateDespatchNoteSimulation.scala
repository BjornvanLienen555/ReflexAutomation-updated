package nl.gall.reflex.testdata

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.scenario.Simulation
import io.gatling.core.structure.ScenarioBuilder
// used for specifying durations with a unit, eg "5 minutes"
import scala.concurrent.duration._
import scala.language.postfixOps

class CreateDespatchNoteSimulation extends Simulation {
  // specify number of despatch notes to generate in repeat (with 1 user in setUp)
  val receiving: ScenarioBuilder = scenario("Create DespatchNotes").repeat(20) {
    exec(karateFeature("classpath:nl/gall/reflex/features/CreateDespatchNotes_for_PT.feature"))
      .pause(1 seconds)
  }

  setUp(receiving.inject(atOnceUsers(1)))

  // run user forever, specify maxDuration in setUp
  /*val receiving: ScenarioBuilder = scenario("Create DespatchNotes").asLongAs(true) {
    exec(karateFeature("classpath:nl/gall/reflex/features/CreateDespatchNotes_for_PT.feature"))
      .pause(1 seconds)
  }*/

  // based on request/sec, ignores pause in scenario
  /*setUp(receiving.inject(constantUsersPerSec(1).during(1 minutes)))
    .throttle(
      reachRps(1).in(10),
      holdFor(2.minutes))*/

  // ramupup during 1 minute, with maxDuration. Use with asLongAs(true)
  /*  setUp(receiving.inject(rampUsers(5).during(1 minutes)))
    .maxDuration(2.minutes)*/

}