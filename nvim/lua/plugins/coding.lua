--- @type LazyPluginSpec[]
return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<C-n>"] = { "snippet_forward", "fallback" },
        ["<C-p>"] = { "snippet_backward", "fallback" },
      },
      completion = {
        list = {
          selection = {
            preselect = true,
          },
        },
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "single" } },
    },
  },

  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        mux = {
          enabled = true,
          backend = "tmux",
        },
        win = {
          layout = "float",
          float = { width = 1.0, height = 1.0 },
          keys = {
            -- buffers       = { "<M-b>", "buffers"   , mode = "nt", desc = "open buffer picker" },
            -- files         = { "<M-f>", "files"     , mode = "nt", desc = "open file picker" },
            -- hide_ctrl_q   = { "<M-q>", "hide"      , mode = "n" , desc = "hide the terminal window" },
            -- prompt        = { "<M-p>", "prompt"    , mode = "t" , desc = "insert prompt or context" },
            -- stopinsert    = { "<M-q>", "stopinsert", mode = "t" , desc = "enter normal mode" },
            -- hide_cli      = { "<c-?>", "hide", mode="nt", desc="hide the terminal window" }
          },
        },
        prompts = {
          changes = "审查一下我的修改吗？",
          diagnostics = "帮我修复 {file} 中的诊断信息吗？\n{diagnostics}",
          diagnostics_all = "帮我修复以下诊断信息吗？\n{diagnostics_all}",
          document = "在 {position} 处添加文档说明",
          explain = "解释 {this}",
          fix = "修复 {this} 吗？",
          optimize = "如何优化 {this}？",
          review = "审查一下 {file}，看看是否存在任何问题或改进点",
          tests = "为 {this} 编写测试",
        },
        tools = {
          cfuse = {
            cmd = { "cfuse" },
          },
        },
      },
    },
  },
}
