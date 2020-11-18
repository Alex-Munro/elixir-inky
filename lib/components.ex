defmodule Inky.Components do
  # wrapper
  def parse({"wrapper", attributes, content}) do
    {"table", [{"class", "wrapper"} | attributes],
     [
       {"tbody", [],
        [
          {"tr", [],
           [
             {"td", [{"class", "wrapper-inner"}], content}
           ]}
        ]}
     ]}
  end

  # row
  def parse({"row", attributes, content}) do
    {"table", [{"class", "row"} | attributes],
     [
       {"tbody", [],
        [
          {"tr", [], content}
        ]}
     ]}
  end

  # center
  def parse({"center", attributes, content}) do
    {"center", [{"class", "float-center"}, {"align", "center"} | attributes], content}
  end

  # menu
  def parse({"menu", attributes, content}) do
    {"table", [{"class", "menu"} | attributes],
     [
       {"tbody", [],
        [
          {"tr", [],
           [
             {"td", [],
              {"table", [],
               [
                 {"tbody", [],
                  [
                    {"tr", [], content}
                  ]}
               ]}}
           ]}
        ]}
     ]}
  end

  # item (for menus)
  def parse({"item", attributes, content}) do
    # case attributes do
    #  [{"href", url}] -> {"th",[] ,[{"a", [{"href", url}]}], content}
    #  _ -> {"th",[] ,[{"a", attributes}], content}
    # end
    {"th", [{"class", "item"}], [{"a", attributes, content}]}
  end

  #  spacer
  # TODO - add the show-for-large and hide-for-large variants
  def parse({"spacer", [{"size", height}], _content}) do
    {"table", [{"class", "spacer"}],
     [
       {"tbody", [],
        [
          {"tr", [],
           [
             {"td",
              [{"height", height}, {"style", "font-size:#{height}px;line-height:#{height}px"}],
              " "}
           ]}
        ]}
     ]}
  end

  # container
  def parse({"container", attributes, content}) do
    {"table", [{"class", "container"}, {"align", "center"} | attributes],
     [
       {"tbody", [],
        [
          {"tr", [],
           [
             {"td", [], content}
           ]}
        ]}
     ]}
  end

  # buttons
  def parse({"button", [{"class", _classes}, {"href", url}], content}) do
    {"table", [{"class", "button"}],
     [
       {"tbody", [],
        [
          {"tr", [],
           [
             {"td", [], {"a", [{"href", url}], content}}
           ]}
        ]}
     ]}
  end

  def parse({"button", [{"href", url}], content}) do
    {"table", [{"class", "button"}],
     [
       {"tbody", [],
        [
          {"tr", [],
           [
             {"td", [], {"a", [{"href", url}], content}}
           ]}
        ]}
     ]}
  end

  def parse({"button", attributes, content}) do
    {"table", [{"class", "button"}],
     [
       {"tbody", [],
        [
          {"tr", [],
           [
             {"td", [], {"a", attributes, content}}
           ]}
        ]}
     ]}
  end

  # block-grid
  def parse({"block-grid", attributes, content}) do
    {"table", [{"class", "block-grid"} | attributes],
     [
       {"tbody", [],
        [
          {"tr", [], content}
        ]}
     ]}
  end

  # callout
  def parse({"callout", attributes, content}) do
    {"table", [{"class", "callout"} | attributes],
     [
       {"tbody", [],
        [{"tr", [], [{"th", attributes, content}, {"th", [{"class", "expander"}], []}]}]}
     ]}
  end

  # hr
  def parse({"h-line", attributes, content}) do
    {"table", [{"class", "h-line"} | attributes],
     [
       {"tbody", [],
        [
          {"tr", [], [{"th", [], content}]}
        ]}
     ]}
  end

  # catchall for other tags
  def parse({tag, attributes, content}) do
    {tag, attributes, content}
  end
end
