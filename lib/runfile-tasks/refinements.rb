module RunfileTasks
  module Refinements
    refine String do
      def ansi_colors
        {
          r: "\e[31m", g: "\e[32m", y: "\e[33m",
          b: "\e[34m", p: "\e[35m", c: "\e[36m", n: "\e[0m"
        }
      end

      def in_color
        gsub /(r|g|y|b|p|c|n)\`([^\`]*)\`/ do |code, subtext|
          "#{ansi_colors[$1.to_sym]}#{$2}#{ansi_colors[:n]}"
        end
      end
    end
  end
end