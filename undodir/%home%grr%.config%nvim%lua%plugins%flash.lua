Vim�UnDo� ���/��˨4d�z���̟��1Qk� � O�                    8       8   8   8    g~    _�                             ����                                                                                                                                                                                                                                                                                                                                                             gߏ    �                   �               5��                                          �      5�_�                   
   ^    ����                                                                                                                                                                                                                                                                                                                                         ^       v   ^    g��     �   	   
          {    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },5��    	                      �      |               5�_�                   
   ^    ����                                                                                                                                                                                                                                                                                                                                         ^       v   ^    g�     �   	   
          }    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },5��    	                      �      ~               5�_�      	              	       ����                                                                                                                                                                                                                                                                                                                                         ^       v   ^    g�     �      	          v    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },5��                          K      w               5�_�      
           	      	    ����                                                                                                                                                                                                                                                                                                                               	                 v       g�&     �         
      p    { "zk",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��                        e                     �                        e                     �                        e                     5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                               	                 v       g�)     �         
      p    { "<>",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��                         f                      5�_�   
                        ����                                                                                                                                                                                                                                                                                                                               	                 v       g�,     �         
      v    { "<leader>",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��                         m                      5�_�                       	    ����                                                                                                                                                                                                                                                                                                                               	                 v       g�/     �      	   
      {    { "Zk",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                        �                     �                        �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               	                 v       g�1     �      	   
      {    { "<>",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                               	                 v       g�2    �      	   
      �    { "<leader>",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�     �      	   
      �    { "<leader>Z",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                        �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�    �         
      w    { "<leader>z",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��                         n                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g��     �         
      x    { "<leader>zz",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��                         n                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       g��     �         
      w    { "<leader>z",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��                         n                      �                        m                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       g��    �      	   
      �    { "<leader>zt",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                         �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g�     �              
   return {   	"folke/flash.nvim",   	event = "VeryLazy",   	opts = {},     -- stylua: ignore   
  keys = {   w    { "<leader>/",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },   �    { "<leader>z",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },     },   }5��            
                      `             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g�     �                   �               5��                                           �      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�     �               U		max_length = 100,  -- Set this to the maximum length of text you want to search for5��                         L                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�     �               T		max_length = 00,  -- Set this to the maximum length of text you want to search for5��                         L                      5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             g��    �               S		max_length = 0,  -- Set this to the maximum length of text you want to search for5��                         L                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g��     �                	-- stylua: ignore5��                          �                      5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             g�     �               T		max_length = 10,  -- Set this to the maximum length of text you want to search for5��                       O                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�     �                B		-- Set this to the maximum length of text you want to search for5��                          P       C               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�     �               	},5��                        R                      �                          S                      �                         R                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g�!     �      	         	},5��                        Q                      �                          R                      �                         R                      5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                             g�"     �               	5��                         Q                      5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                             g�"     �               		�             5��                         R                      5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                             g�'     �               		�             �               		no_quickfix = true5��                        d                      �                         g                      5�_�   "   $           #          ����                                                                                                                                                                                                                                                                                                                                                             g�)    �               		no_quickfix = true5��                         d                      �                        d                     5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                                             g�e     �   
            u		{ "<leader>/",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   $   '           %          ����                                                                                                                                                                                                                                                                                                                                                             g�k     �   
            t		{ "<leader>",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      �    
                     �                      5�_�   %   (   &       '          ����                                                                                                                                                                                                                                                                                                                                                             g�s     �               �		{ "<leader>z",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                                              5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                             g�t   	 �               		{ "<leader>",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                                              �                                            5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                             g�     �   
            u		{ "<leader>q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                             g�     �   
            t		{ "<eader>q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                             g�     �   
            s		{ "<ader>q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                             g�     �   
            r		{ "<der>q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                             g�     �   
            q		{ "<er>q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                             g�     �   
            p		{ "<r>q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                             g�     �   
            o		{ "<>q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   /   8           0          ����                                                                                                                                                                                                                                                                                                                                                             g�    �   
            n		{ "<q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },5��    
                     �                      5�_�   0       3       8          ����                                                                                                                                                                                                                                                                                                                                                             g}    �                �		{ "<leader>Q",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                          �       �               5�_�   0   4   2   8   3          ����                                                                                                                                                                                                                                                                                                                                                             gj     �               		treesitter = rue,5��                         u                      5�_�   3   5           4          ����                                                                                                                                                                                                                                                                                                                                                             gk     �               		treesitter = ue,5��                         u                      5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                                                             gk     �               		treesitter = e,5��                         u                      5�_�   5   7           6          ����                                                                                                                                                                                                                                                                                                                                                             gk     �               		treesitter = ,5��                         u                      5�_�   6               7          ����                                                                                                                                                                                                                                                                                                                                                             gk    �               		treesitter = false,5��                         u                      �                        u                     5�_�   0       1   3   2           ����                                                                                                                                                                                                                                                                                                                                                             g\    �              5��                          �       �               5�_�   0           2   1          ����                                                                                                                                                                                                                                                                                                                                                             g�     �             �               vim.opt.mouse = ''5��                          y                     5�_�   %           '   &          ����                                                                                                                                                                                                                                                                                                                                                             g�p     �               		{ "<leader>",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },5��                                              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�     �             �               f		max_length = 10, no_quickfix = true -- Set this to the maximum length of text you want to search for5��                         P                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�     �               R		max_length = ,  -- Set this to the maximum length of text you want to search for5��                         L                      5�_�                   
   ^    ����                                                                                                                                                                                                                                                                                                                                         ^       v   ^    g�     �   	           5��    	                      �      ~               5�_�                     
       ����                                                                                                                                                                                                                                                                                                                                         ^       v   ^    g�     �   	              2,5��    	                    �                    5�_�                   
   ^    ����                                                                                                                                                                                                                                                                                                                                         ^       v   ^    g��     �   	            {    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, aaaaaa "Treesitter Search" },5��    	   ^                                      �    	   _                 !                    �    	   `                 "                    �    	   a                 #                    �    	   b                 $                    �    	   c                 %                    5�_�                    
   ^    ����                                                                                                                                                                                                                                                                                                                                         ^       v   ^    g��     �   	            {    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, nisc = "Treesitter Search" },5��    	   ^                                      �    	   _                 !                    5��