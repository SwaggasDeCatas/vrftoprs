return function()

	local TextChatService = game:GetService("TextChatService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local Remotes = ReplicatedStorage:WaitForChild("Remotes")
	local SystemMessageEvent = Remotes:WaitForChild("lllIlllllllIIIlllllIlIIIllllIIIII")

	local TextChannels = TextChatService:WaitForChild("TextChannels")
	local RBXGeneral = TextChannels:WaitForChild("RBXGeneral")

	-- Custom rendering for system messages with encoded color
	TextChatService.OnIncomingMessage = function(message)
		if message.TextSource == nil and message.Metadata then
			local splitMeta = string.split(message.Metadata, ":")
			if splitMeta[1] == "PeriusMessage" and splitMeta[2] then
				local hexColor = splitMeta[2]

				local props = Instance.new("TextChatMessageProperties")
				props.Text = string.format("<font color='%s'>%s</font>", hexColor, message.Text)
				return props
			end
		elseif message.TextSource then
			local playerName = message.TextSource.Name
			message.PrefixText = "[" .. playerName .. "]"
		end
	end

	-- Listen for remote system messages
	SystemMessageEvent.OnClientEvent:Connect(function(data)
		if typeof(data) ~= "table" then return end

		local text = data.Message
		local color = data.Color
		local metadata = data.Metadata

		if typeof(text) == "string" and typeof(color) == "Color3" and metadata == "PeriusMessage" then
			local hexColor = string.format("#%02X%02X%02X", color.R * 255, color.G * 255, color.B * 255)
			local metadataWithColor = metadata .. ":" .. hexColor
			RBXGeneral:DisplaySystemMessage(text, metadataWithColor)
		end
	end)
end

