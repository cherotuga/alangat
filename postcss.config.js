module.exports = {
    plugins: {
      'postcss-import': {},
      'tailwindcss/nesting': {},
      tailwindcss: {},
      autoprefixer: {
        flexbox: 'no-2009'
      },
      ...(process.env.HUGO_ENVIRONMENT === 'production' ? {
        '@fullhuman/postcss-purgecss': {
          content: ['./hugo_stats.json'],
          defaultExtractor: (content) => {
            let els = JSON.parse(content).htmlElements;
            return els.tags.concat(els.classes, els.ids);
          }
        }
      } : {})
    }
  }