<script>
$(function(){
	$("#contact_add").button({
		icons: {
			primary: 'ui-icon-plusthick',
			secondary: 'ui-icon-person'
		},
		text:false
    });
	$("#group_add").button({
		icons: {
			primary: 'ui-icon-plusthick',
			secondary: 'ui-icon-home'
		},
		text:false
    });
	$("#contact_edit").button({
		icons: {
			primary: 'ui-icon-wrench',
			secondary: 'ui-icon-person'
		},
		text:false
    });
	$("#group_edit").button({
		icons: {
			primary: 'ui-icon-wrench',
			secondary: 'ui-icon-home'
		},
		text:false
    });
	
	$("ul>li").mouseover(function(){
		$(this).addClass("highlight");
	});
	
	$("ul>li").mouseout(function(){
		$(this).removeClass("highlight");
	});
	
	$("#group_dialog").dialog({
		autoOpen: false,
		modal:true
	});
	
	$("#contact_dialog").dialog({
		autoOpen: false,
		modal:true
	});
	
	$("#message_dialog").dialog({
		autoOpen: false,
		modal:true
	});
	
	$("#contact_add").click(function(){
		$("input:hidden[name='contact.id']").val('');
		$("input:text[name='contact.firstName']").val('');
		$("input:text[name='contact.lastName']").val('');
		$("#group_boxs").hide();
		$("#contact_dialog").dialog("open");
	});
	
	$("#group_add").click(function(){
		$("input:hidden[name='group.id']").val('');
		$("input:text[name='group.name']").val('');
		$("#group_dialog").dialog("open");
	});

	$("#contact_edit").click(function(){
		var id = '${(m.contact.id)!""}';
		if(!id){
		$("#message_dialog").html('Please select a contact');
			$("#message_dialog").dialog("open");
			return ;
		}
		$("input:hidden[name='contact.id']").val(id);
		$("input:text[name='contact.firstName']").val('${(m.contact.firstName)!""}');
		$("input:text[name='contact.lastName']").val('${(m.contact.lastName)!""}');
		$("#group_boxs").show();
		$("#contact_dialog").dialog("open");
	});
	
	$("#group_edit").click(function(){
		var id = '${(m.group.id)!""}';
		if(!id){
		$("#message_dialog").html('Please select a group');
			$("#message_dialog").dialog("open");
			return ;
		}
		$("input:hidden[name='group.id']").val(id);
		$("input:text[name='group.name']").val('${(m.group.name)!""}');
		$("#group_dialog").dialog("open");
	});	
});
</script>
<div id="content">
<div id="title"><button id="contact_add" >Add Contact</button>&nbsp;<button id="group_add" >Add Group</button></div>

<div id="first_column">
	<div class="head">My Groups</div>
	<div class="container">
		<ul id="groups" class="list">	
			[#list m.groups as group]
				<li>
					<a href="${r.contextPath}/home?groupId=${group.id}">
						<div  class="left">${group.name}</div>
						<div class="right">
							[#if (group.contacts)??]
								${(group.contacts)?size}
								[#else]
								0
							[/#if]
						</div>
					</a>
				</li>	
			[/#list]
		</ul>
	</div>
</div>

<div id="second_column">
	<div class="head">My Contacts</div>
	<div class="container">
		<ul id="contacts" class="list">
			[#list m.contacts as contact]
				<li>
					<a href="${r.contextPath}/home?groupId=${(m.group.id)!""}&contactId=${(contact.id)!""}">
						${contact.firstName}.${contact.lastName}
					</a>
				</li>	
			[/#list]
		</ul>
	</div>
</div>

<div id="third_column">
	<div class="head"><button id="contact_edit" >Edit Contact</button>&nbsp;<button id="group_edit" >Edit Group</button></div>
	<div clas="container">
		[#if (m.contact)??]
			<ul id="contact_info" class="list">
					<li>
						<span class="name">${m.contact.firstName}&nbsp;${m.contact.lastName}</span>
					</li>	
					<li>
						&nbsp;
					</li>	
					<li>
						First Name:${m.contact.firstName}
					</li>	
					<li>
						Last Name:${m.contact.lastName}
					</li>	
			</ul>
		[/#if]
	</div>
</div>

<div id="contact_dialog" title="Contact Form">
	<form method="POST" action="${r.contextPath}/home">
  		<input type="hidden" name="action" value="demoContact:createOrUpdateContact" />
  		<input type="hidden" name="contact.id" value="${(m.contact.id)!""}" />
  		<label>First Name:</label> <input type="text" name="contact.firstName"  value="${(m.contact.firstName)!""}">
  		<br/>
  		<label>Last Name:</label> <input type="text" name="contact.lastName"  value="${(m.contact.lastName)!""}">
  		<br/>
  		<div id="group_boxs">
  		<label>Add to Groups:</label> 
  			[#list m.groups as group]
  			    [#assign check="" /]
  			    [#if (m.contact)??]
	  				[#list m.contact.groups as cgroup]
	  					[#if cgroup.id==group.id]
	  						[#assign check="checked" /]
	  					[/#if]
					[/#list]
				[/#if]
				<div ><input type="checkbox" name="contact.groupIds" value="${(group.id)!""}" ${check} />${(group.name)!""}</div>
			[/#list]
		<div>
  		<br/>
  		<input type="submit" value="Save Contact" />
	</form>
</div>

<div id="group_dialog" title="Group Form">
	<form method="POST" action="${r.contextPath}/home">
  		<input type="hidden" name="action" value="demoContact:createOrUpdateGroup" />
  		<input type="hidden" name="group.id" value="${(m.group.id)!""}" />
  		<label>Group Name:</label> <input type="text" name="group.name"  value="${(m.group.name)!""}">
  		<br/>
  		<input type="submit" value="Save Group" />
	</form>
</div>

<div id="message_dialog" title="message"><div>