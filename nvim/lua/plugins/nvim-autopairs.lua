---------------------------------------------
-- nvim-autopairs
---------------------------------------------
return {
  { -- 括弧とクォーテーションを自動で閉じる
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
}

