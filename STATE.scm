;;; STATE.scm - Seven Tentacles Project State
;;; Format: Guile Scheme (s-expressions)
;;; Last Updated: 2025-12-08
;;; Spec: https://github.com/hyperpolymath/state.scm

;;;============================================================================
;;; METADATA
;;;============================================================================

(define state-version "1.0.0")
(define last-updated "2025-12-08")
(define project-name "Seven Tentacles")
(define repository "hyperpolymath/7-tentacles")

;;;============================================================================
;;; CURRENT POSITION
;;;============================================================================

(define current-position
  '((overall-completion . "15%")
    (phase . "Foundation Complete, Content Creation Begins")
    (summary . "Exceptional pedagogical framework designed and documented.
                Technology foundation solid. Curriculum content is the
                critical bottleneck - only 8% of Cuttle stage lessons exist.")

    (completed-components
     ((framework-design . "100%")
      (rescript-agent-definitions . "100%")
      (build-infrastructure . "100%")
      (reveal-demo-system . "100%")
      (documentation . "100%")
      (tabletop-game-rules . "100%")))

    (partial-components
     ((curriculum-content . "8%")   ; 11/140 Cuttle lessons
      (lesson-player . "80%")       ; template exists, needs integration
      (tabletop-cards . "43%")      ; 3/7 games have printable cards
      (me-language . "5%")))        ; examples only, no interpreter

    (not-started
     ("Solo Language implementation"
      "Duet Language implementation"
      "Ensemble Language implementation"
      "Squidlet stage curriculum (ages 13-14)"
      "Duet stage curriculum (age 15)"
      "Octopus stage curriculum (ages 16+)"
      "User authentication/class management"
      "Full accessibility audit"
      "Translations"))))

;;;============================================================================
;;; ROUTE TO MVP v1
;;;============================================================================

(define mvp-roadmap
  '((target . "MVP v1: First Playable Educational Experience")
    (total-effort-hours . 477)
    (estimated-timeline . "12 weeks solo, 6-8 weeks with 2-3 contributors")
    (bottleneck . "Curriculum writing, not technology")

    (phases
     ((phase-1
       (name . "Tabletop Games Complete")
       (weeks . "1-2")
       (effort-hours . 32)
       (tasks
        ("Finish Orange game cards (concurrency/scheduling)")
        ("Finish Green game cards (code structure/trees)")
        ("Finish Indigo game cards (patterns/templates)")
        ("Finish Violet game cards (rules/governance)"))
       (deliverable . "All 7 tabletop games playable and printable"))

      (phase-2
       (name . "Red Path Complete")
       (weeks . "3-5")
       (effort-hours . 140)
       (tasks
        ("Write Red lessons 6-20 (racing -> parsing journey)")
        ("Implement basic Me Language interpreter")
        ("Integrate Blockly for visual programming")
        ("Build lesson player curriculum loader")
        ("Connect lesson player to Red curriculum"))
       (deliverable . "First complete agent path: 20 lessons playable"))

      (phase-3
       (name . "Expand Content")
       (weeks . "6-9")
       (effort-hours . 180)
       (tasks
        ("Yellow lessons 2-20 (sorting -> type system)")
        ("Blue lessons 2-20 (mystery -> verification)")
        ("Orange lessons 1-10 (juggling -> concurrency)")
        ("Expand activity types (more games, puzzles, creative)")
        ("Cross-agent narrative connections"))
       (deliverable . "3 complete paths, 60+ lessons"))

      (phase-4
       (name . "MVP Polish")
       (weeks . "10-12")
       (effort-hours . 125)
       (tasks
        ("Green, Indigo, Violet lessons 1-10")
        ("WCAG 2.1 AA accessibility pass")
        ("Performance optimization")
        ("User testing with target age groups")
        ("GitHub Pages deployment"))
       (deliverable . "MVP v1 ready for public launch"))))))

;;;============================================================================
;;; ISSUES AND BLOCKERS
;;;============================================================================

(define current-issues
  '((critical
     ((issue . "Curriculum Content Gap")
      (description . "Only 11 of 140 Cuttle stage lessons exist (8%)")
      (impact . "Cannot launch without substantial content")
      (effort-to-resolve . "260 hours")
      (mitigation . "Prioritize Red path first for proof-of-concept"))

     ((issue . "Me Language Not Implemented")
      (description . "5 example programs exist but no interpreter/runtime")
      (impact . "Interactive lessons cannot execute student code")
      (effort-to-resolve . "64 hours")
      (mitigation . "Start with Blockly integration for visual-only MVP")))

    (moderate
     ((issue . "Lesson Player Incomplete")
      (description . "HTML template exists but cannot load curriculum files")
      (impact . "No way to deliver lessons to users")
      (effort-to-resolve . "24 hours")
      (blocker . "Needs curriculum content to test against"))

     ((issue . "4 Tabletop Games Missing Cards")
      (description . "Orange, Green, Indigo, Violet have rules but no printables")
      (impact . "Cannot offer complete tabletop experience")
      (effort-to-resolve . "32 hours")
      (note . "Low-hanging fruit, good for contributors"))

     ((issue . "No Automated Tests")
      (description . "package.json shows 'No tests configured yet'")
      (impact . "Risk of regressions as codebase grows")
      (effort-to-resolve . "16 hours initial setup")))

    (minor
     ((issue . "AGENT_INTERVIEWS.adoc Missing")
      (description . "Referenced in README but file doesn't exist")
      (impact . "Documentation gap")
      (effort-to-resolve . "4 hours"))

     ((issue . "No Deployment")
      (description . "Project not deployed anywhere publicly")
      (impact . "Cannot share working demo")
      (effort-to-resolve . "11 hours for GitHub Pages")))))

;;;============================================================================
;;; QUESTIONS FOR PROJECT OWNER
;;;============================================================================

(define open-questions
  '((strategic
     ((question . "What is the target launch date or milestone?")
      (context . "Helps prioritize phases and scope MVP")
      (options . ("Q1 2026 soft launch" "School year 2026-27" "No deadline, quality first")))

     ((question . "Who is the primary initial audience?")
      (context . "Affects content tone, complexity, activity types")
      (options . ("Homeschool families" "After-school programs" "Classroom teachers" "Self-directed kids")))

     ((question . "Should MVP focus on one agent path or breadth?")
      (context . "Red-only MVP is faster but less representative")
      (tradeoff . "Depth (Red 1-20) vs Breadth (All agents 1-5)")))

    (technical
     ((question . "What is the Me Language interpreter strategy?")
      (context . "Affects ~64 hours of development effort")
      (options . ("Blockly-only (visual, no text)"
                  "Simple tree-walking interpreter"
                  "Compile to JavaScript"
                  "External sandbox like Pyodide")))

     ((question . "Hosting and deployment preferences?")
      (context . "Static site vs server-side requirements")
      (options . ("GitHub Pages (free, static)"
                  "Vercel/Netlify"
                  "Self-hosted with user accounts")))

     ((question . "How should progress be persisted?")
      (context . "Kids lose devices, share computers")
      (options . ("LocalStorage (simple, device-bound)"
                  "QR code/export (portable)"
                  "Account system (complex)"))))

    (pedagogical
     ((question . "Has the reveal system been tested with actual children?")
      (context . "Core pedagogical hypothesis is untested")
      (concern . "Kids might feel 'tricked' at reveal moment"))

     ((question . "Should activities support offline/printed versions?")
      (context . "Many schools have limited device access")
      (impact . "Changes how activities are designed"))

     ((question . "Is there a subject matter expert for compiler pedagogy?")
      (context . "Mapping games to CS concepts needs validation")
      (note . "PEDAGOGY.adoc mentions research opportunities")))))

;;;============================================================================
;;; LONG-TERM ROADMAP
;;;============================================================================

(define long-term-roadmap
  '((vision . "10-year journey teaching compiler architecture through play")

    (milestones
     ((milestone-1
       (name . "MVP v1: Cuttle Proof-of-Concept")
       (target . "2026")
       (scope . "Ages 8-12, 7 agents, Me Language")
       (lessons . "140 Cuttle lessons complete")
       (success-criteria . ("1000+ active learners"
                           "Positive educator feedback"
                           "Kids engaged without knowing CS")))

      (milestone-2
       (name . "Squidlet Release")
       (target . "2027")
       (scope . "Ages 13-14, Solo Language, text-based")
       (lessons . "210 Squidlet lessons")
       (key-feature . "Transition from visual to text programming")
       (success-criteria . ("Cuttle graduates advancing"
                           "Affine types introduced naturally"
                           "First 'aha' moments about real CS")))

      (milestone-3
       (name . "Duet Collaboration")
       (target . "2028")
       (scope . "Age 15, two-party protocols")
       (lessons . "70 Duet lessons")
       (key-feature . "Multiplayer programming, session types")
       (success-criteria . ("Peer collaboration working"
                           "Protocol design emerging"
                           "Social learning validated")))

      (milestone-4
       (name . "Octopus: The Big Reveal")
       (target . "2029")
       (scope . "Ages 16+, full compiler understanding")
       (lessons . "100+ Octopus lessons")
       (key-feature . "Students realize they've learned compilers")
       (success-criteria . ("Students can build toy compilers"
                           "University-level understanding"
                           "Research validation published")))

      (milestone-5
       (name . "Global Scale")
       (target . "2030+")
       (scope . "Translations, accessibility, research")
       (goals . ("10+ languages supported"
                "Formal accessibility certification"
                "Academic papers published"
                "Teacher training program"
                "Open curriculum contributions")))))

    (research-opportunities
     ("Longitudinal study of reveal effectiveness"
      "Comparative analysis with traditional CS curricula"
      "Accessibility impact on diverse learners"
      "Game mechanics and learning retention"
      "Cross-cultural adaptation of mascot narratives"))

    (scaling-considerations
     ("Teacher training and certification program"
      "Curriculum localization pipeline"
      "Community contribution framework"
      "Assessment and credentialing"
      "Integration with formal education systems"))))

;;;============================================================================
;;; NEXT ACTIONS (PRIORITIZED)
;;;============================================================================

(define critical-next-actions
  '(((priority . 1)
     (action . "Complete Red lessons 6-10")
     (rationale . "Extends strongest agent path toward proof-of-concept")
     (effort . "20 hours")
     (assignee . "unassigned"))

    ((priority . 2)
     (action . "Design Me Language interpreter architecture")
     (rationale . "Unblocks interactive lesson development")
     (effort . "8 hours")
     (decision-needed . "Blockly-only vs full interpreter"))

    ((priority . 3)
     (action . "Finish Orange tabletop cards")
     (rationale . "Low-hanging fruit, completes one more game")
     (effort . "8 hours")
     (good-first-issue . #t))

    ((priority . 4)
     (action . "Build lesson player curriculum loader")
     (rationale . "Enables testing lessons in-browser")
     (effort . "16 hours")
     (dependency . "Needs lessons 6-10 for content to load"))

    ((priority . 5)
     (action . "Set up GitHub Pages deployment")
     (rationale . "Makes progress shareable and demo-able")
     (effort . "4 hours")
     (good-first-issue . #t))

    ((priority . 6)
     (action . "Write basic test suite")
     (rationale . "Prevents regressions as development accelerates")
     (effort . "16 hours")
     (scope . "Agent definitions, curriculum structure validation"))))

;;;============================================================================
;;; PROJECT HEALTH SUMMARY
;;;============================================================================

(define project-health
  '((strengths
     ("Exceptional pedagogical design and documentation"
      "Clear vision with 10-year roadmap"
      "Solid technical foundation (ReScript, types)"
      "Community-ready (CONTRIBUTING, CODE_OF_CONDUCT)"
      "Research-oriented design from the start"
      "Innovative approach to CS education gap"))

    (weaknesses
     ("Content creation is the major bottleneck"
      "No working interactive product yet"
      "Core hypothesis (reveal) untested with children"
      "Single contributor risk"
      "No automated testing"))

    (opportunities
     ("Growing demand for CS education"
      "Unique approach differentiates from competitors"
      "Academic publication potential"
      "Open source community growth"
      "Foundation/grant funding possibilities"))

    (threats
     ("Competitor products with more resources"
      "Curriculum quality at scale"
      "Maintaining engagement over 10-year journey"
      "Technical complexity of 4 language implementations"))))

;;; End of STATE.scm
