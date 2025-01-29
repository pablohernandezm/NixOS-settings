return {
  {
    'mistricky/codesnap.nvim',
    build = 'make build_generator',
    opts = {
      bg_theme = 'peach',
      bg_padding = 10,
      save_path = '~/Pictures',
      has_breadcrumbs = true,
      has_line_numbers = true,
      mac_window_bar = false,
      title = '',
      watermark = '',
    },
  }
}
