-- Lua filter to count words in a document
-- https://pandoc.org/lua-filters.html#counting-words-in-a-document

words = 0
chars = 0

count = {
  Str = function(el)
    -- we don't count a word if it's entirely punctuation:
    if el.text:match("%P") then
        words = words + 1
        chars = chars + el.text:len()
    end
  end
}

function Pandoc(el)
    -- skip metadata, just count body:
    pandoc.walk_block(pandoc.Div(el.blocks), count)
    print(words .. " words")
    print(chars .. " characters")
    os.exit(0)
end
