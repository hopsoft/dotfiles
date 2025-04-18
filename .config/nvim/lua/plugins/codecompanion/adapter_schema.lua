local default_thinking_budget = 4096

local default_schema = {
  --- Controls the user identifier for the AI interaction
  -- Determines how the AI identifies and addresses the user during interactions.
  -- This setting helps maintain consistent communication and can be used to
  -- track or customize interactions based on user identity.
  --
  -- Use cases with examples:
  -- * Personal projects:
  --   - Individual developer identification
  --   - Personal coding environment
  --   - Local development setup
  --   - Custom configuration tracking
  --
  -- * Team environments:
  --   - Developer role identification
  --   - Team member distinction
  --   - Collaboration tracking
  --   - Project contribution marking
  --
  -- * System integration:
  --   - Service account identification
  --   - Automation script tracking
  --   - CI/CD pipeline marking
  --   - System-level operations
  --
  -- Note: Consider using:
  -- - Consistent naming across sessions
  -- - Meaningful identifiers for tracking
  -- - Role-based names for teams
  -- - Project-specific identifiers
  --
  -- @field[type=string] user
  -- @within options
  user = { default = "hopsoft-neovim" },

  -- In adapter_schema.lua, add this with the other settings

  --- Controls whether to enable extended thinking mode for complex reasoning
  -- Enables the model to spend more time analyzing and planning responses,
  -- particularly useful for complex programming tasks, architecture decisions,
  -- and detailed code analysis. When enabled, allows configuration of
  -- thinking-specific parameters like temperature.
  --
  -- Use cases with examples:
  -- * Disabled (false):
  --   - Quick code completions
  --   - Simple documentation tasks
  --   - Direct answers to straightforward questions
  --   - When fast response time is priority
  --
  -- * Enabled with conservative temperature (true, temp: 0.2-0.3):
  --   - Production code generation
  --   - Security-critical implementations
  --   - API design decisions
  --   - Database schema planning
  --   - Configuration file generation
  --
  -- * Enabled with balanced temperature (true, temp: 0.4-0.6):
  --   - Architecture discussions
  --   - Code refactoring analysis
  --   - Design pattern recommendations
  --   - Performance optimization planning
  --   - Technical documentation generation
  --
  -- * Enabled with creative temperature (true, temp: 0.7-0.9):
  --   - Problem-solving exploration
  --   - Alternative implementation brainstorming
  --   - System design discussions
  --   - Learning examples
  --   - Architectural innovation
  --
  -- Note: When enabled:
  -- - Responses may take longer but show more depth
  -- - Model considers more context and implications
  -- - Temperature setting affects reasoning style
  -- - Thinking budget controls analysis depth
  --
  -- @field[type=table] extended_thinking
  -- @within options
  extended_thinking = {
    default = false,
    opts = { temperature = 0.1 }
  },

  --- Controls how much the AI avoids repeating the same words and phrases
  --
  -- Use cases with examples:
  -- * No penalty (0):
  --   - Writing technical documentation where specific terms need to be repeated
  --   - Writing programming tutorials where consistency in naming is crucial
  --   - Creating API documentation where method names must be consistent
  --   - Writing code comments that refer to specific functions or variables
  --
  -- * Moderate penalty (1):
  --   - Writing blog posts about programming concepts
  --   - Creating general technical articles
  --   - Writing marketing copy for technical products
  --   - Generating varied code examples
  --
  -- * Maximum penalty (2):
  --   - Writing engaging technical presentations
  --   - Creating dynamic social media content about programming
  --   - Writing creative technical blog introductions
  --   - Generating varied error messages or user feedback
  --
  -- @field[type=number] frequency_penalty
  -- @within options
  -- @range 0-2
  frequency_penalty = { default = 0.5 },

  --- Controls how likely specific words are to appear in the response
  --
  -- Use cases with examples:
  -- * Strong reduction (-100):
  --   - Preventing technical jargon in beginner-friendly documentation
  --   - Avoiding complex mathematical terms in basic tutorials
  --   - Reducing framework-specific terms when explaining general concepts
  --   - Preventing use of deprecated function names in documentation
  --
  -- * Mild reduction (-50):
  --   - Reducing but not eliminating technical abbreviations
  --   - Decreasing usage of platform-specific terminology
  --   - Softly discouraging certain programming paradigm terms
  --   - Limiting framework-specific jargon while still allowing key terms
  --
  -- * Neutral (0):
  --   - General technical writing with balanced vocabulary
  --   - Standard API documentation
  --   - Regular code comments
  --   - Mixed audience technical content
  --
  -- * Mild increase (50):
  --   - Encouraging use of official technical terms
  --   - Promoting consistent design pattern terminology
  --   - Emphasizing specific programming language keywords
  --   - Favoring standardized variable naming conventions
  --
  -- * Strong increase (100):
  --   - Ensuring use of exact API method names
  --   - Enforcing specific technical standard terminology
  --   - Maintaining default_schema naming conventions in documentation
  --   - Guaranteeing use of precise mathematical or scientific terms
  --
  -- @field[type=number] logit_bias
  -- @within options
  -- @range -100-100
  logit_bias = { default = 0.1 },

  --- Controls the maximum length of the response in tokens
  --
  -- Use cases with examples:
  -- * Short responses (50-100 tokens):
  --   - Writing concise error messages
  --   - Generating brief code comments
  --   - Creating function descriptions
  --   - Writing commit messages
  --
  -- * Medium responses (250-500 tokens):
  --   - Writing method documentation
  --   - Explaining code blocks
  --   - Creating API endpoint descriptions
  --   - Writing release notes
  --
  -- * Long responses (1000-2000 tokens):
  --   - Writing comprehensive technical guides
  --   - Creating detailed API documentation
  --   - Explaining complex algorithms
  --   - Writing tutorial sections
  --
  -- * Maximum length (4000+ tokens):
  --   - Generating complete technical documentation
  --   - Writing full technical specifications
  --   - Creating comprehensive setup guides
  --   - Developing complete tutorial chapters
  --
  -- @field[type=number] max_tokens
  -- @within options
  -- @range 1-200000
  max_completion_tokens = { default = default_thinking_budget * 2 },

  --- Controls whether to enable Mirostat sampling for text generation
  -- Mirostat is a sampling technique that dynamically adjusts top-k sampling
  -- to maintain a target perplexity (controlled by `microstat_ent`), balancing
  -- generation quality between repetition and randomness.
  --
  -- Use cases with examples:
  -- * Basic text generation:
  --   - Enable Mirostat for more coherent responses
  --   - Disable for standard top-k sampling
  --
  -- * Fine-tuned generation:
  --   - Enable when needing consistent tone/quality
  --   - Disable for creative/experimental outputs
  --
  -- * Model-specific optimization:
  --   - Use with CLASS 3/4 models for best results
  --   - Experiment with both modes for different prompts
  --
  -- @field[type=boolean] microstat
  -- @within options
  -- @default false
  -- @range 0-2
  microstat = { default = 2 },

  --- Controls how quickly Mirostat adjusts its sampling strategy
  -- A learning rate parameter that determines how fast Mirostat adapts
  -- to changes in text generation. Lower values mean slower, more stable
  -- adjustments, while higher values allow faster adaptation.
  --
  -- Use cases with examples:
  -- * Conservative adjustment (0.1):
  --   - Long-form technical documentation
  --   - API reference generation
  --   - When consistency is critical
  --   - Production-ready code comments
  --
  -- * Balanced adjustment (0.3):
  --   - General documentation tasks
  --   - Mixed technical/creative writing
  --   - Standard code explanation
  --   - Tutorial generation
  --
  -- * Responsive adjustment (0.5):
  --   - Interactive documentation
  --   - Quick code snippets
  --   - When rapid adaptation is needed
  --   - Experimental generation tasks
  --
  -- Note: Only applies when Mirostat sampling is enabled
  -- Recommended range is 0.1-0.5 for most use cases
  --
  -- @field[type=number] microstat_eta
  -- @within options
  -- @range 0.1-0.5
  microstat_eta = { default = 0.1 },

  --- Controls the target entropy (randomness) for Mirostat sampling
  -- Higher values allow more creative and varied responses, while lower
  -- values produce more focused and deterministic outputs. This setting
  -- helps balance between conservative and creative text generation.
  --
  -- Use cases with examples:
  -- * Conservative generation (5-6):
  --   - Technical API documentation
  --   - Precise code comments
  --   - Error message generation
  --   - Standard function descriptions
  --
  -- * Balanced generation (6-7):
  --   - General documentation
  --   - Tutorial writing
  --   - Code explanations
  --   - Technical blog posts
  --
  -- * Creative generation (7-8):
  --   - Alternative solution suggestions
  --   - Problem-solving approaches
  --   - Educational examples
  --   - Architectural discussions
  --
  -- Note: Only applies when Mirostat sampling is enabled
  -- Recommended range is 6-8 for most technical writing
  --
  -- @field[type=number] microstat_tau
  -- @within options
  -- @range 5-8
  microstat_tau = { default = 6 },

  --- Controls the size of the context window (total tokens for prompt + response)
  -- Determines how much text the model can process at once. A larger context
  -- window allows the model to "see" more previous text but requires more memory.
  -- This setting must be supported by your chosen model.
  --
  -- Use cases with examples:
  -- * Small context (2K-4K tokens):
  --   - Quick code snippets
  --   - Single function documentation
  --   - Brief error explanations
  --   - Memory-constrained environments
  --
  -- * Medium context (8K-16K tokens):
  --   - Multiple function documentation
  --   - File-level code analysis
  --   - Detailed technical explanations
  --   - Standard documentation tasks
  --
  -- * Large context (32K tokens):
  --   - Entire class/module analysis
  --   - Complex system documentation
  --   - Multi-file code review
  --   - Extended technical discussions
  --
  -- * Maximum context (64K-128K tokens):
  --   - Large codebase analysis
  --   - Complete project documentation
  --   - Extensive technical specifications
  --   - Multi-document processing
  --
  -- Note: Actual maximum varies by model:
  -- - Basic models: ~4K tokens
  -- - Standard models: ~8K-16K tokens
  -- - Advanced models: 32K-128K tokens
  -- Choose based on your model's capabilities and available memory
  --
  -- @field[type=number] num_ctx
  -- @within options
  -- @range 512-128000+
  num_ctx = { default = default_thinking_budget * 8 },

  --- Controls the maximum number of tokens to generate in the response
  -- Determines how long the generated text can be. A higher value allows
  -- for longer responses but requires more processing time. This limit
  -- applies only to the generated response, not the input prompt.
  --
  -- Use cases with examples:
  -- * Short responses (50-100 tokens):
  --   - Quick inline code comments
  --   - Function summaries
  --   - Variable descriptions
  --   - Git commit messages
  --
  -- * Medium responses (200-500 tokens):
  --   - Function documentation blocks
  --   - Code block explanations
  --   - Bug fix descriptions
  --   - API endpoint documentation
  --
  -- * Long responses (1000-2000 tokens):
  --   - Module documentation
  --   - Algorithm explanations
  --   - Technical guides
  --   - Design pattern descriptions
  --
  -- * Extended responses (3000+ tokens):
  --   - Complete class documentation
  --   - System architecture docs
  --   - Tutorial generation
  --   - Technical specifications
  --
  -- Note: Choose based on your needs:
  -- - Shorter values = faster generation
  -- - Longer values = more comprehensive responses
  -- - Must be less than or equal to num_ctx
  --
  -- @field[type=number] num_predict
  -- @within options
  -- @range 1-32768
  num_predict = { default = default_thinking_budget * 2 },

  --- Controls how much the AI avoids repeating topics and themes
  --
  -- Use cases with examples:
  -- * No penalty (0):
  --   - Writing step-by-step programming tutorials
  --   - Explaining complex technical concepts thoroughly
  --   - Creating detailed API documentation sections
  --   - Deep diving into specific programming topics
  --
  -- * Moderate penalty (1):
  --   - Writing broad technical overviews
  --   - Creating diverse code examples
  --   - Generating varied debugging suggestions
  --   - Writing multi-topic technical articles
  --
  -- * Maximum penalty (2):
  --   - Brainstorming different solution approaches
  --   - Exploring alternative programming paradigms
  --   - Generating diverse feature suggestions
  --   - Creating varied architectural proposals
  --
  -- @field[type=number] presence_penalty
  -- @within options
  -- @range 0-2
  presence_penalty = { default = 0.2 },

  --- Controls how many tokens to look back when checking for repetition
  -- Determines the size of the window used for repetition detection.
  -- A larger window means the model checks more previous tokens when
  -- applying the repeat penalty, helping to catch longer repetitive patterns.
  --
  -- Use cases with examples:
  -- * Small window (64-128 tokens):
  --   - Writing concise code comments
  --   - Generating short error messages
  --   - Creating brief function descriptions
  --   - Quick documentation snippets
  --
  -- * Medium window (256-512 tokens):
  --   - Writing method documentation
  --   - Generating code explanations
  --   - Creating API endpoint descriptions
  --   - Technical article sections
  --
  -- * Large window (1024+ tokens):
  --   - Writing long-form documentation
  --   - Creating tutorial content
  --   - Generating complex explanations
  --   - Technical specifications
  --
  -- Note: Works in conjunction with repeat_penalty
  -- - Larger values catch more repetition but impact performance
  -- - Smaller values focus on local repetition patterns
  -- - Should be less than or equal to context window size
  --
  -- @field[type=number] repeat_last_n
  -- @within options
  -- @range 64-4096
  repeat_last_n = { default = 256 },

  --- Controls how strongly to penalize repetitions in the generated text
  -- Determines how much to reduce the likelihood of repeating content
  -- from the previous tokens (specified by repeat_last_n). Higher values
  -- create stronger penalties against repeating any content.
  --
  -- Use cases with examples:
  -- * Light penalty (1.0-1.1):
  --   - Writing technical documentation
  --   - API reference generation
  --   - Function documentation
  --   - Where consistent terminology is important
  --
  -- * Medium penalty (1.1-1.3):
  --   - Code explanations
  --   - Tutorial writing
  --   - Error message generation
  --   - General documentation tasks
  --
  -- * Strong penalty (1.3-1.5):
  --   - Creative coding examples
  --   - Alternative solutions
  --   - Varied explanations
  --   - When diversity is important
  --
  -- Note: Works in conjunction with repeat_last_n
  -- - Values below 1.0 may increase repetition
  -- - Higher values may make text feel disjointed
  -- - Adjust based on content requirements
  --
  -- @field[type=number] repeat_penalty
  -- @within options
  -- @range 1.0-2.0
  repeat_penalty = { default = 1.5 },

  --- Controls the random seed for text generation
  -- Determines the starting point for random number generation,
  -- allowing for reproducible outputs. Setting a specific seed
  -- will generate the same text for identical inputs, while -1
  -- uses a random seed each time.
  --
  -- Use cases with examples:
  -- * Random seed (-1):
  --   - Normal development work
  --   - General documentation generation
  --   - Creative coding suggestions
  --   - When variety is desired
  --
  -- * Fixed seed (positive number):
  --   - Debugging generated content
  --   - Testing documentation output
  --   - Reproducing specific results
  --   - Comparing model behaviors
  --
  -- Common testing seeds:
  -- - 42: Traditional testing seed
  -- - 12345: Easy to remember
  -- - 1234567890: Comprehensive testing
  --
  -- Note: Reproducibility requires:
  -- - Same model and parameters
  -- - Identical input text
  -- - Same context window content
  --
  -- @field[type=number] seed
  -- @within options
  -- @range -1-4294967295
  seed = { default = -1 },

  --- Controls which sequences of characters will stop text generation
  -- Defines a list of strings that will cause the AI to stop generating
  -- when encountered. Useful for controlling where responses end and
  -- ensuring proper formatting of generated content.
  --
  -- Use cases with examples:
  -- * Code documentation:
  --   - ["*/"]           : Stop at end of doc comment
  --   - ["```"]          : Stop at end of code block
  --   - ["--"]           : Stop at line comments
  --   - ["*/", "```"]    : Stop at either marker
  --
  -- * Function definitions:
  --   - ["end"]          : Stop at Lua function end
  --   - ["}"]            : Stop at function block close
  --   - ["return"]       : Stop before return statement
  --   - [");"]           : Stop at function declaration end
  --
  -- * Documentation blocks:
  --   - ["@param"]       : Stop before parameter docs
  --   - ["@return"]      : Stop before return docs
  --   - ["---"]          : Stop at doc block separator
  --   - ["\n\n"]         : Stop at paragraph break
  --
  -- Note: Multiple stop sequences:
  -- - Are checked in order provided
  -- - Can include whitespace
  -- - Case sensitive by default
  -- - Empty list means no early stopping
  --
  -- @field[type=table] stop
  -- @within options
  stop = { default = nil },

  --- Controls the token budget allocated for Claude's thinking before generating a response
  --
  -- Use cases with examples:
  -- * Small thinking budget (100-500 tokens):
  --   - Simple factual questions
  --   - Basic text formatting tasks
  --   - Straightforward code completion
  --   - Quick summaries of short content
  --
  -- * Medium thinking budget (1000-2000 tokens):
  --   - Analyzing medium-length documents
  --   - Solving moderately complex problems
  --   - Providing nuanced explanations
  --   - Generating structured content
  --
  -- * Large thinking budget (3000-5000 tokens):
  --   - Analyzing complex code bases
  --   - Solving multi-step reasoning problems
  --   - Performing detailed document analysis
  --   - Creating well-structured long-form content
  --
  -- * Maximum thinking budget (10000+ tokens):
  --   - Solving complex mathematical proofs
  --   - Performing comprehensive code reviews
  --   - Analyzing lengthy technical documents
  --   - Tackling multi-stage reasoning challenges
  --
  -- @field[type=number] thinking_budget
  -- @within options
  -- @range 0-100000
  thinking_budget = { default = default_thinking_budget },

  --- Controls the randomness/creativity in the generated text
  -- Determines how focused or creative the responses will be. Lower values
  -- produce more deterministic, conservative outputs while higher values
  -- increase creativity and variability in the responses.
  --
  -- Use cases with examples:
  -- * Conservative (0.1-0.3):
  --   - Writing precise API documentation
  --   - Generating exact code examples
  --   - Creating error messages
  --   - Technical specifications
  --   - Exact function descriptions
  --
  -- * Balanced (0.4-0.7):
  --   - General code documentation
  --   - Tutorial writing
  --   - Bug fix suggestions
  --   - Code refactoring ideas
  --   - Standard comments
  --
  -- * Creative (0.8-1.2):
  --   - Alternative solution brainstorming
  --   - Architecture discussions
  --   - Problem-solving approaches
  --   - Learning examples
  --   - Explanatory analogies
  --
  -- Note: Impact on generation:
  -- - Lower = more predictable, focused responses
  -- - Higher = more creative, varied responses
  -- - 0.0 = most likely completion only
  -- - Consider task requirements when setting
  --
  -- @field[type=number] temperature
  -- @within options
  -- @range 0.0-2.0
  temperature = {
    default = 0.1,
    mapping = "parameters",
  },

  --- Controls tail free sampling, reducing low-probability token noise
  -- Determines how aggressively to filter out unlikely tokens based on
  -- their probability distribution. Higher values are more aggressive
  -- in removing unlikely tokens, leading to more focused output.
  --
  -- Use cases with examples:
  -- * Minimal filtering (0.1-0.3):
  --   - Creative programming solutions
  --   - Brainstorming sessions
  --   - Alternative approaches
  --   - Experimental code examples
  --   - When diversity is valuable
  --
  -- * Balanced filtering (0.4-0.7):
  --   - General documentation
  --   - Code explanations
  --   - Tutorial writing
  --   - Standard comments
  --   - Typical use cases
  --
  -- * Aggressive filtering (0.8-1.0):
  --   - Technical specifications
  --   - API documentation
  --   - Critical code comments
  --   - Error messages
  --   - When precision is crucial
  --
  -- Note: Effects on generation:
  -- - Higher values = more focused, conservative text
  -- - Lower values = more creative, varied text
  -- - Works well with temperature adjustment
  -- - 1.0 can be too redefault_schemaive for creative tasks
  --
  -- @field[type=number] tfs_z Tail free sampling parameter
  -- @within options
  -- @range 0.0-1.0
  tfs_z = { default = 0.8 },

  --- Controls how many of the most likely tokens to consider for generation
  -- Limits token selection to the K most probable tokens. A lower value
  -- means more focused and conservative output, while higher values
  -- allow for more variety but may include less relevant tokens.
  --
  -- Use cases with examples:
  -- * Strict selection (10-20):
  --   - Writing precise API documentation
  --   - Generating exact code snippets
  --   - Critical error messages
  --   - Function signatures
  --   - When accuracy is crucial
  --
  -- * Balanced selection (40-60):
  --   - General code documentation
  --   - Standard comments
  --   - Tutorial writing
  --   - Bug descriptions
  --   - Common programming tasks
  --
  -- * Diverse selection (80-100):
  --   - Creative problem solving
  --   - Alternative implementations
  --   - Learning examples
  --   - Brainstorming sessions
  --   - When variety is desired
  --
  -- Note: Selection impact:
  -- - Lower = more predictable, focused output
  -- - Higher = more variety, potentially less relevant
  -- - 0 disables top_k filtering
  -- - Works well with top_p sampling
  --
  -- @field[type=number] top_k Number of tokens to consider
  -- @within options
  -- @range 0-100
  top_k = {
    default = 40,
    mapping = "parameters",
  },

  --- Controls token selection based on cumulative probability threshold
  -- Uses nucleus sampling to select tokens whose cumulative probability
  -- exceeds P. More dynamic than top_k as it adapts to the probability
  -- distribution of tokens rather than using a fixed count.
  --
  -- Use cases with examples:
  -- * Conservative sampling (0.1-0.3):
  --   - Critical documentation
  --   - Exact API references
  --   - Function signatures
  --   - Error handling code
  --   - When precision is essential
  --
  -- * Balanced sampling (0.4-0.7):
  --   - Standard documentation
  --   - Code explanations
  --   - Common examples
  --   - Implementation guides
  --   - Typical use cases
  --
  -- * Creative sampling (0.8-0.95):
  --   - Alternative solutions
  --   - Code refactoring ideas
  --   - Design patterns
  --   - Learning examples
  --   - Brainstorming sessions
  --
  -- Note: Generation characteristics:
  -- - Lower values = more focused, deterministic output
  -- - Higher values = more diverse, creative output
  -- - Works well with top_k filtering
  -- - 1.0 considers all tokens (not recommended)
  --
  -- @field[type=number] top_p
  -- @within options
  -- @range 0.0-1.0
  top_p = {
    default = 0.2,
    mapping = "parameters",
  },
}

local expand = function(overrides, options)
  overrides = overrides or {}
  options = options or {}
  options.omit = options.omit or {}
  options.only = options.only or {}

  local schema = {}
  for key, val in pairs(default_schema) do
    if #options.only == 0 or vim.tbl_contains(options.only, key) then
      if not vim.tbl_contains(options.omit, key) then schema[key] = val end
    end
  end

  return vim.tbl_deep_extend("force", schema, overrides)
end

return { expand = expand }
