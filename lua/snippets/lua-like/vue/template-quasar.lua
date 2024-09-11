local ls = require("luasnip")
local su = require("snippets.lua-like.utils")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local tag = su.tag
local one_tag = su.one_tag

local prefix = "<q-"

local snippets = {
    {
        name = "btn",
        desc = "A highly customizable button component with various styling options.",
    },
    {
        name = "icon",
        desc = "Displays icons from different icon libraries with support for SVG and font icons.",
    },
    {
        name = "input",
        desc = "A versatile input field component for handling user text input.",
    },
    {
        name = "checkbox",
        desc = "A checkbox component for selecting one or multiple options.",
    },
    {
        name = "radio",
        desc = "A radio button component for selecting one option from a set.",
    },
    {
        name = "toggle",
        desc = "A switch component for toggling between on and off states.",
    },
    {
        name = "select",
        desc = "A dropdown select component for picking one or more items from a list.",
    },
    {
        name = "chip",
        desc = "A small, interactive element used to represent information or actions.",
    },
    {
        name = "card",
        desc = "A card component for containing content in a styled, rectangular container.",
    },
    {
        name = "dialog",
        desc = "A modal dialog component for displaying content or collecting input from users.",
    },
    {
        name = "drawer",
        desc = "A sidebar component for displaying navigation or additional content.",
    },
    {
        name = "tooltip",
        desc = "A tooltip component for showing brief informational text when hovering over an element.",
    },
    {
        name = "toolbar",
        desc = "A toolbar component for grouping actions or displaying navigation items.",
    },
    {
        name = "table",
        desc = "A table component for displaying data in a structured, tabular format.",
    },
    {
        name = "list",
        desc = "A list component for displaying items in a structured, vertical list.",
    },
    {
        name = "item",
        desc = "A list item component that is part of the QList component, customizable and interactive.",
    },
    {
        name = "page",
        desc = "A component representing a single page in a multi-page application.",
    },
    {
        name = "page-container",
        desc = "A container component for holding the content of a QPage.",
    },
    {
        name = "page-sticky",
        desc = "A component for positioning elements sticky within a QPage.",
    },
    {
        name = "pagination",
        desc = "A pagination component for navigating through pages of content.",
    },
    {
        name = "stepper",
        desc = "A stepper component for displaying and controlling multi-step processes.",
    },
    {
        name = "tab-panels",
        desc = "A tabbed component for switching between different panels of content.",
    },
    {
        name = "tabs",
        desc = "A tab navigation component for switching between different views or sections.",
    },
    {
        name = "banner",
        desc = "A banner component for displaying prominent messages or information.",
    },
    {
        name = "avatar",
        desc = "A component for displaying an avatar, often used to represent users.",
    },
    {
        name = "badge",
        desc = "A small, color-coded label for indicating status or displaying small amounts of information.",
    },
    {
        name = "bar",
        desc = "A flexible container for organizing content horizontally.",
    },
    {
        name = "breadcrumbs",
        desc = "A component for displaying a breadcrumb trail, indicating the current page's location in a hierarchy.",
    },
    {
        name = "carousel",
        desc = "A carousel component for displaying content in a rotating slideshow.",
    },
    {
        name = "expansion-item",
        desc = "An expandable list item component for showing or hiding additional content.",
    },
    {
        name = "ajax-bar",
        desc = "A loading bar component that automatically triggers on AJAX requests.",
    },
    {
        name = "btn-group",
        desc = "A button group component for grouping multiple buttons together.",
    },
    {
        name = "btn-dropdown",
        desc = "A dropdown button component that combines a button with a dropdown menu.",
    },
    {
        name = "carousel-control",
        desc = "A control component for navigating through carousel items.",
    },
    {
        name = "chat-message",
        desc = "A component for displaying chat messages with various layouts and styles.",
    },
    {
        name = "circular-progress",
        desc = "A circular progress indicator for showing loading or progress status.",
    },
    {
        name = "color",
        desc = "A color picker component for selecting colors visually.",
    },
    {
        name = "fab",
        desc = "A floating action button component for displaying a primary action.",
    },
    {
        name = "fab-action",
        desc = "An action button that is part of a QFab component, typically used for additional actions.",
    },
    {
        name = "card-section",
        desc = "A section component for dividing content within a card.",
    },
    {
        name = "card-actions",
        desc = "A component for adding action buttons or links to a card.",
    },
    {
        name = "file",
        desc = "A file input component for selecting files with various customization options.",
    },
    {
        name = "form",
        desc = "A form component for managing form validation and submission.",
    },
    {
        name = "field",
        desc = "A wrapper component for form inputs, providing styling and validation features.",
    },
    {
        name = "btn-toggle",
        desc = "A toggle button component for switching between two states.",
    },
    {
        name = "option-group",
        desc = "A component for grouping multiple QRadio or QCheckbox options together.",
    },
    {
        name = "slider",
        desc = "A slider component for selecting a value or range of values visually.",
    },
    {
        name = "range",
        desc = "A range slider component for selecting a range between two values.",
    },
    {
        name = "time",
        desc = "A time picker component for selecting a time visually.",
    },
    {
        name = "date",
        desc = "A date picker component for selecting a date visually.",
    },
    {
        name = "img",
        desc = "An image component with lazy loading, placeholders, and error handling.",
    },
    {
        name = "infinite-scroll",
        desc = "A component for loading more content as the user scrolls down.",
    },
    {
        name = "inner-loading",
        desc = "A loading indicator that displays inside another component or element.",
    },
    {
        name = "intersection",
        desc = "A utility component for detecting when an element enters or leaves the viewport.",
    },
    {
        name = "knob",
        desc = "A circular control used to select a value by rotating a knob.",
    },
    {
        name = "linear-progress",
        desc = "A linear progress bar for indicating loading or progress status.",
    },
    {
        name = "item-section",
        desc = "A section component used inside QItem to organize content.",
    },
    {
        name = "item-label",
        desc = "A label component for displaying text inside a QItem.",
    },
    {
        name = "markup-table",
        desc = "A simple table component for displaying structured data in a tabular format.",
    },
    {
        name = "menu",
        desc = "A dropdown menu component for displaying a list of actions or options.",
    },
    {
        name = "no-ssr",
        desc = "A component that renders its children only on the client-side, not during server-side rendering.",
    },
    {
        name = "parallax",
        desc = "A parallax effect component that creates a 3D depth illusion on scrolling.",
    },
    {
        name = "popup-edit",
        desc = "A popup editor component for editing content in place.",
    },
    {
        name = "popup-proxy",
        desc = "A utility component for dynamically displaying popups based on trigger events.",
    },
    {
        name = "pull-to-refresh",
        desc = "A component for refreshing content by pulling down, typically used on mobile devices.",
    },
    {
        name = "rating",
        desc = "A rating component for displaying or collecting user ratings.",
    },
    {
        name = "responsive",
        desc = "A component for managing responsive design based on screen size changes.",
    },
    {
        name = "scroll-area",
        desc = "A scrollable area component with custom scrollbar styling.",
    },
    {
        name = "separator",
        desc = "A visual separator component for dividing content into sections.",
    },
    {
        name = "skeleton",
        desc = "A placeholder loading component that mimics the layout of the content being loaded.",
    },
    {
        name = "slide-item",
        desc = "A component that provides sliding panels with various actions, typically used in lists.",
    },
    {
        name = "slide-transition",
        desc = "A transition component for sliding animations, useful for showing or hiding content smoothly.",
    },
    {
        name = "space",
        desc = "A spacer component used to create flexible space between elements in a layout.",
    },
    {
        name = "spinner",
        desc = "A spinner component that provides various styles for indicating loading states.",
    },
    {
        name = "splitter",
        desc = "A layout component that allows resizing of two or more sections by dragging a divider.",
    },
    {
        name = "step",
        desc = "A component representing a single step in a QStepper, often containing a title and content.",
    },
    {
        name = "stepper-navigation",
        desc = "A navigation component for moving between steps in a QStepper.",
    },
    {
        name = "th",
        desc = "A table header cell component used within a QTable for defining column headers.",
    },
    {
        name = "tr",
        desc = "A table row component used within a QTable for organizing rows of data.",
    },
    {
        name = "td",
        desc = "A table data cell component used within QTable to display individual data cells.",
    },
    {
        name = "tab",
        desc = "A tab component for navigation, used within QTabs to switch between different views or sections.",
    },
    {
        name = "route-tab",
        desc = "A tab component specifically for Vue Router, allowing for navigation between routes.",
    },
    {
        name = "tab-panel",
        desc = "A panel component used within QTabPanels to display content associated with a specific tab.",
    },
    {
        name = "timeline",
        desc = "A timeline component for displaying a chronological list of events or activities.",
    },
    {
        name = "timeline-entry",
        desc = "An entry component for QTimeline, representing a single event with a timestamp and description.",
    },
    {
        name = "toolbar-title",
        desc = "A component for setting the title in a toolbar, typically used within QToolbar.",
    },
    {
        name = "tree",
        desc = "A tree view component for displaying hierarchical data with expandable and collapsible nodes.",
    },
    {
        name = "uploader",
        desc = "A file uploader component for uploading files with support for drag-and-drop, previews, and progress tracking.",
    },
    {
        name = "video",
        desc = "A video player component for embedding and playing video files with custom controls.",
    },
    {
        name = "virtual-scroll",
        desc = "A component for rendering large lists efficiently by only displaying the visible items and dynamically loading more as needed.",
    },
}


local luasnip_snippets = {}
for i, snippet in pairs(snippets) do
    table.insert(luasnip_snippets, s({
        trig = prefix .. snippet.name,
        name = snippet.name,
        desc = snippet.desc,
        show_condition = su.check_prefix("<q%-"),
        priority = 5,
    }, snippet.body or su.tag("q-" .. snippet.name)))
end

ls.add_snippets("vue", luasnip_snippets)
