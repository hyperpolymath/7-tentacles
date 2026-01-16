;; SPDX-License-Identifier: AGPL-3.0-or-later
;; STATE.scm - Project state for Seven Tentacles

(state
  (metadata
    (version "1.0.0")
    (schema-version "1.0")
    (created "2025-01-09")
    (updated "2025-01-16")
    (project "7-tentacles")
    (repo "hyperpolymath/7-tentacles"))

  (project-context
    (name "Seven Tentacles")
    (tagline "Teaching Compiler Architecture to Ages 8-18 Through Progressive Reveal")
    (tech-stack ("rescript" "deno" "html")))

  (current-position
    (phase "mvp")
    (overall-completion 100)
    (components
      ((agents . 100)
       (reveal-system . 100)
       (lesson-player . 100)
       (curriculum-structure . 100)
       (documentation . 100)))
    (working-features
      ("7 agent personalities with stage-based naming"
       "Progressive reveal system"
       "Interactive lesson player"
       "HTML-based demos"
       "Comprehensive documentation")))

  (route-to-mvp
    (milestones
      ((name "Agent Framework")
       (status "complete")
       (items
         ("Types.res with agent/stage types"
          "7 color-coded agent modules"
          "Stage-based name reveal"
          "Personality system")))
      ((name "Tools")
       (status "complete")
       (items
         ("RevealSystem.res"
          "reveal-demo.html"
          "lesson-player.html"
          "dev_server.js")))
      ((name "Documentation")
       (status "complete")
       (items
         ("VISION.adoc (detailed pedagogy)"
          "ROADMAP.adoc (10-year plan)"
          "README.adoc (quick start)")))
      ((name "MVP 1.0")
       (status "complete")
       (items
         ("Working reveal demos"
          "All 7 agents defined"
          "Curriculum structure")))))

  (blockers-and-issues
    (critical ())
    (high ())
    (medium
      (("Curriculum content" . "Need 140+ Cuttle lessons")
       ("Language implementations" . "Me/Solo/Duet/Ensemble dialects")))
    (low ()))

  (critical-next-actions
    (immediate ())
    (this-week
      ("Tag v1.0.0 release"))
    (this-month
      ("Write first 10 Cuttle lessons for Red agent"
       "Implement Me Language prototype")))

  (the-seven-agents
    ((red . "Parser - Lexical analysis, parsing, syntax trees")
     (orange . "Concurrency Engine - Async/await, scheduling")
     (yellow . "Type System - Affine types, memory safety")
     (green . "AST Architect - Code representation")
     (blue . "Auditor - Verification, tracing, debugging")
     (indigo . "Metaprogrammer - Compile-time evaluation, macros")
     (violet . "Governance System - Language design, policy")))

  (cephalopod-journey
    ((cuttle . "Ages 8-12: Baby cuttlefish, visual Me Language")
     (squidlet . "Ages 13-14: Names change, CS concepts emerge")
     (duet . "Age 15: Two-party collaboration")
     (octopus . "Ages 16+: Full orchestration, build compilers"))))
