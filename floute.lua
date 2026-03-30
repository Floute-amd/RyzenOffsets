-- Rayfield UI | Script Moved Notice
-- Paste your new script link below

local NewLink = "loadstring(game:HttpGet("https://raw.githubusercontent.com/Floute-amd/RyzenOffsets/refs/heads/main/floute_hub.lua", true))()" -- << Replace this with your actual link

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load Rayfield
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not success then
    warn("Failed to load Rayfield: " .. tostring(Rayfield))
    return
end

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "Script Moved",
    LoadingTitle = "Notice",
    LoadingSubtitle = "Please read below",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Create Tab
local Tab = Window:CreateTab("Notice", "alert-triangle")

-- Moved Label
Tab:CreateSection("Script Has Moved")

Tab:CreateLabel("This script has been moved to a new location. Please update your executor script with the new link below.")

-- New Link Input (display-only)
Tab:CreateInput({
    Name = "New Script Link",
    PlaceholderText = NewLink,
    RemoveTextAfterFocusLost = false,
    Callback = function(Value) end,
})

-- Copy Button
Tab:CreateButton({
    Name = "Copy New Link",
    Callback = function()
        setclipboard(NewLink)
        Rayfield:Notify({
            Title = "Copied!",
            Content = "The new script link has been copied to your clipboard.",
            Duration = 4,
            Image = "check",
        })
    end,
})

-- Divider & Extra Info
Tab:CreateSection("How to Use")

Tab:CreateLabel("1. Click 'Copy New Link' above.")
Tab:CreateLabel("2. Open your executor and paste the link.")
Tab:CreateLabel("3. Execute the new script. Enjoy!")

-- Auto notify on load
Rayfield:Notify({
    Title = "Script Moved",
    Content = "This script has a new home. Check the UI for the updated link.",
    Duration = 6,
    Image = "info",
})
