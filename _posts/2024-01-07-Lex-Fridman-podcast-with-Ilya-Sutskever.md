---
layout: post
title: Lex Fridman podcast with Ilya Sutskever
date: 2024-01-07 10:05:56
---

Я помучил сегодня чатжпт. Заставил бедолагу править транскрипт подкаста. Транскрипт взял автогенеренный из ютуба. В целом чатжпт неплохо справляется. Но все же приходится руками потом еще много подправлять. Самая частая правка, которую приходится делать - это когда он путает кто говорит. Изредка чат делает совсем наглости, типа решает пропустить предложение.

Вот что получилось:

## Introduction

[0:00](https://youtu.be/13CZPWmke6A?t=0)
**Lex Fridman:** The following is a conversation with Ilya Sutskever, co-founder and chief scientist of OpenAI, one of the most cited computer scientists in history with over 165,000 citations. And to me, one of the most brilliant and insightful minds ever in the field of deep learning. There are very few people in this world who I would rather talk to and brainstorm with about deep learning, intelligence, and life in general than Ilya, on and off the mic. This was an honor and a pleasure. This conversation was recorded before the outbreak of the pandemic. For everyone feeling the medical, psychological, and financial burden of this crisis, I'm sending love your way. Stay strong. We're in this together. We'll beat this thing. This is the Artificial Intelligence Podcast. If you enjoy it, subscribe on YouTube, review it with five stars on Apple Podcasts, support it on Patreon, or simply connect with me on Twitter at Lex Fridman, spelled F-R-I-D-M-A-N. As usual, I'll do a few minutes of ads now and never any ads in the middle that can break the flow of the conversation. I hope that works for you and doesn't hurt the listening experience. This show is presented by Cash App, the number one finance app in the App Store. When you get it, use code Lex Podcast. Cash App lets you send money to friends, buy Bitcoin, and invest in the stock market with as little as one dollar. Since Cash App allows you to buy Bitcoin, let me mention that cryptocurrency, in the context of the history of money, is fascinating. I recommend "Ascent of Money" as a great book on this history. Both the book and audiobook are great. Debits and credits on ledgers started around 30,000 years ago, the US dollar was created over 200 years ago, and Bitcoin, the first decentralized cryptocurrency, was released just over 10 years ago. So, given that history, cryptocurrency is still very much in its early days of development but it's still aiming to, and just might, redefine the nature of money. So again, if you get Cash App from the App Store or Google Play and use the code Lex Podcast, you get ten dollars, and Cash App will also donate ten dollars to FIRST, an organization that is helping advance robotics and STEM education for young people around the world.

**Lex Fridman:** And now, here's my conversation with Ilya Sutskever.

## AlexNet Paper and the ImageNet Moment

[2:23](https://youtu.be/13CZPWmke6A?t=143)
**Lex Fridman:** You were one of the three authors, with Alex Krizhevsky and Jeff Hinton, of the famed AlexNet paper, that is arguably the paper that marked the big catalytic moment that launched the deep learning revolution at that time. Take us back to that time. What was your intuition about neural networks, about the representational power of neural networks, and maybe you could mention how did that evolve over the next few years up to today, over the 10 years?

**Ilya Sutskever:** Yeah, I can answer that question. At some point, in about 2010 or 2011, I connected two facts in my mind. The realization was this: at some point, we realized that we can train very large — I shouldn't say very, you know, they're tiny by today's standards — but large and deep neural networks end-to-end with backpropagation. At some point, different people obtained this result; I obtained this result. The first moment in which I realized that deep neural networks are powerful was when James Martens invented the Hessian-free optimizer in 2010, and he trained a 10-layer neural network end-to-end without pre-training, from scratch. And when that happened, I thought, "This is it." Because if you can train a big neural network, a big neural network can represent very complicated functions. Because if you have a neural network with 10 layers, it's as though you allow the human brain to run for some number of milliseconds. Neuron firings are slow, and so in maybe 100 milliseconds, your neurons only fire 10 times. So, it's also kind of like 10 layers. And in 100 milliseconds, you can perfectly recognize any object. So, I thought, so I already had the idea then that we need to train a very big neural network on lots of supervised data, and then it must succeed. Because we can find the best neural network, and then there's also theory that if you have more data than parameters, you won't overfit. Today, we know that actually, this theory is very incomplete, and you want overfitting when you have less data than parameters, but definitely, if you have more data than parameters, you won't overfit.

**Lex Fridman:** So the fact that neural networks were heavily overparametrized wasn't discouraging to you? So you were thinking about the theory that the number of parameters, the fact there's a huge number of parameters, is okay? It's going to be okay. 

**Ilya Sutskever:** I mean, there was some evidence before that it was okayish, but the theory was most... The theory was that if you had a big dataset and a big neural net, it was going to work. The overparametrization just didn't really figure much as a problem. I thought, well, with images, you're just going to add some data augmentation, it's going to be okay. 

[4:38](https://youtu.be/13CZPWmke6A?t=278)
**Lex Fridman:** So where was any doubt coming from?

**Ilya Sutskever:** The main doubt was, can we train a bigger? Will we have enough computer trainer, a big enough neural net with backpropagation? Backpropagation, I thought, would work. This image wasn't clear, was whether there would be enough compute to get a very convincing result. And then, at some point, Alex Krizhevsky wrote these insanely fast CUDA kernels for training convolutional neural nets, and that was, bam, let's do this. Let's get ImageNet, and it's going to be the greatest thing.

[5:21](https://youtu.be/13CZPWmke6A?t=321)
**Lex Fridman:** Was your intuition most of your intuition from empirical results by you and by others? So like, just actually demonstrating that a piece of program can train a 10-layer neural network, or was there some pen and paper or marker and whiteboard thinking intuition? Like, because you just connected a 10-layer large neural network to the brain. So you just mentioned the brain. So, in your intuition about neural networks, does the human brain come into play as an intuition builder?

**Ilya Sutskever:** Definitely. I mean, you got to be precise with these analogies between neural, artificial neural networks, and the brain. But there is no question that the brain is a huge source of intuition and inspiration for deep learning researchers since all the way from Rosenblatt in the 60s. Like if you look at the whole idea of a neural network is directly inspired by the brain. You had people like McCollum and Pitts who were saying, "Hey, you got these neurons in the brain, and hey, we recently learned about the computer and automata. Can we use some ideas from the computer and automata to design some kind of computational object that's going to be simple, computational, and kind of like the brain?" And they invented the neuron. So they were inspired by it back then. Then you had the convolutional neural network from Fukushima, and then later Yann LeCun, who said, "Hey, if you limit the receptive fields of a neural network, it's going to be especially suitable for images," as it turned out to be true. So, there was a very small number of examples where analogies to the brain were successful, and I thought, "Well, probably an artificial neuron is not that different from the brain if it's trained hard enough. So let's just assume it is and roll with it."

[7:01](https://youtu.be/13CZPWmke6A?t=421)
**Lex Fridman:** So now, we're at a time where deep learning is very successful. So, let us squint less and say, "Let's open our eyes and say what to use an interesting difference between the human brain." Now, I know you're probably not an expert, neither a neuroscientist nor a biologist, but loosely speaking, what's the difference between the human brain and artificial neural networks that's interesting to you for the next decade or two?

**Ilya Sutskever:** That's a good question to ask. What is an interesting difference between the neurons, between the brain and our artificial neural networks? So I feel like today, artificial neural networks... So we all agree that there are certain dimensions in which the human brain vastly outperforms our models. But I also think that there are some ways in which artificial neural networks have a number of very important advantages over the brain. Looking at the advantages versus disadvantages is a good way to figure out what is the important difference. So, the brain uses spikes, which may or may not be important.

[8:00](https://youtu.be/13CZPWmke6A?t=480)
**Lex Fridman:** Yeah, that's a really interesting question. Do you think it's important or not? That's one big architectural difference between artificial neural networks.

**Ilya Sutskever:** And it's hard to tell, but my prior is not very high. And I can say why. You know, there are people who are interested in spiking neural networks, and basically, what they figured out is that they need to simulate the non-spiking neural networks in spikes, and that's how they're going to make them work. If you don't simulate the non-spike in neural networks in spikes, it's not going to work because the question is, why should it work? And that connects to questions around backpropagation and questions around deep learning. You got this giant neural network, why should it work at all? Why should the learning rule work at all?

## Cost functions

[8:36](https://youtu.be/13CZPWmke6A?t=516)
**Ilya Sutskever:** It's not a self-evident question, especially if you, let's say, if you were just starting in the field, and you read the very early papers, you can say, "Hey, people are saying, 'Let's build neural networks.' That's a great idea because the brain is a neural network. So it would be useful to build neural networks. Now, let's figure out how to train them. It should be possible to train them properly, but how?" And so the big idea is the cost function.

**Ilya Sutskever:** That's the big idea. The cost function is a way of measuring the performance of the system according to some measure. 

**Lex Fridman:** By the way, that is a big... actually, let me think, is that... is that a difficult idea to arrive at, and how big of an idea is that? That there's a single cost function.

[9:20](https://youtu.be/13CZPWmke6A?t=560)
**Lex Fridman:** Let me... sorry, let me take a pause. Is supervised learning a difficult concept to come to? 

**Ilya Sutskever:** I don't know. All concepts are very easy in retrospect.

[9:38](https://youtu.be/13CZPWmke6A?t=578)
**Lex Fridman:** Yeah, that's what it seems. Trivial now, but I... So, because the reason I asked that, and we'll talk about it, is there other things? Are there things that don't necessarily have a cost function, maybe have many cost functions, or maybe have dynamic cost functions, or maybe a totally different kind of architectures? Because we have to think like that in order to arrive at something new, right?

[9:57](https://youtu.be/13CZPWmke6A?t=597)
**Ilya Sutskever:** So, the only... the good examples of things which don't have clear cost functions are GANs (Generative Adversarial Networks). Again, you have a game, so instead of thinking of a cost function where you want to optimize, where you know that you have an algorithm, gradient descent, which will optimize the cost function, and then you can reason about the behavior of your system in terms of what it optimizes. With a GAN, you say, "I have a game, and I'll reason about the behavior of the system in terms of the equilibrium of the game." But it's all about coming up with these mathematical objects that help us reason about the behavior of our system, right?

[10:25](https://youtu.be/13CZPWmke6A?t=625)
**Lex Fridman:** That's really interesting. Yes, a GAN is the only one. It's kind of a... The cost function is emergent from the comparison. It's... 

**Ilya Sutskever:** I don't know if it has a cost function. I don't know if it's meaningful to talk about the cost function of a GAN. It's kind of like the cost function of biological evolution or the cost function of the economy. It's... you can talk about regions to which it will go towards, but I don't think the cost function analogy is the most useful.

[11:02](https://youtu.be/13CZPWmke6A?t=662)
**Lex Fridman:** So, if evolution doesn't really have a cost function, like a cost function based on something akin to our mathematical conception of a cost function, then do you think cost functions in deep learning are holding us back? Yeah, I... so you just kind of mentioned that cost function is a nice first profound idea. Do you think it's a good idea? Do you think it's an idea we'll go past? So, self-play starts to touch on that a little bit, uh, in reinforcement learning systems.

[11:28](https://youtu.be/13CZPWmke6A?t=688)
**LIlya Sutskever:** That's right. Self-play and also ideas around exploration, where you're trying to take actions that surprise a predictor. I'm a big fan of cost functions. I think cost functions are great, and they serve us really well. And I think that whenever we can do things because with cost functions, we should. And, you know, maybe there is a chance that we will come up with some yet another profound way of looking at things that will involve cost functions in a less central way, but I don't know. I think cost functions are... I mean, I would not bet against cost functions.

[12:05](https://youtu.be/13CZPWmke6A?t=725)
**Lex Fridman:** Is there other things about the brain that pop into your mind that might be different and interesting for us to consider in designing artificial neural networks? So, we talked about spiking a little bit.

[12:16](https://youtu.be/13CZPWmke6A?t=736)
**Ilya Sutskever:** I mean, one thing which may potentially be useful, I think, people, neuroscientists, figured out something about the learning rule of the brain, or... I'm talking about spike-timing-dependent plasticity. And it would be nice if some people were to study that in simulation.

[12:28](https://youtu.be/13CZPWmke6A?t=748)
**Lex Fridman:** Wait, sorry, spike-timing-dependent plasticity?

[12:34](https://youtu.be/13CZPWmke6A?t=754)
**Ilya Sutskever:** Yeah, STDP. It's a particular learning rule that uses spike timing to figure out how to determine how to update the synapses. So, it's kind of like if the synapse fires into the neuron before the neuron fires, then it strengthens the synapse, and if the synapse fires into the neurons shortly after the neuron fires, then it weakens the synapse, something along this line. I'm 90% sure it's right. So, if I said something wrong here, don't get too angry.

[12:59](https://youtu.be/13CZPWmke6A?t=779)
**Lex Fridman:** But you sounded brilliant while saying it. But the timing, that's one thing that's missing. The temporal dynamics is not captured. I think that's like a fundamental property of the brain, is the timing of the signals.

[13:11](https://youtu.be/13CZPWmke6A?t=791)
**Ilya Sutskever:** Well, you have recurrent neural networks, but you... 

**Lex Fridman:** You think of that as, I mean... That's a very crude, simplified, uh, what's that called, uh, there's a clock, I guess, to, uh, recurring neural networks. It's... this seems like the brain is the general, the continuous version of that. The generalization where all possible timings are possible, and then within those timings, this contains some information.

[13:31](https://youtu.be/13CZPWmke6A?t=811)
**Lex Fridman:** You think recurrent neural networks, the recurrence in recurrent neural networks, can capture the same kind of phenomena as the timing that seems to be important for the brain? In the firing of neurons in the brain?

## Recurrent neural networks

[13:48](https://youtu.be/13CZPWmke6A?t=828)
**Ilya Sutskever:** I mean, I think, I think regarding neurons, recurrent neural networks are amazing. And they can do, I think they can do anything we'd want them to if we'd want a system to do. Right now, recurrent neural networks have been superseded by transformers, but maybe one day they'll make a comeback. Maybe they'll be back.

[14:12](https://youtu.be/13CZPWmke6A?t=852)
**Lex Fridman:** Let me, uh, in a small tangent, say, do you think they'll be back? So much of the breakthroughs recently that we'll talk about on natural language processing and language modeling has been with transformers that don't emphasize recurrence.

[14:30](https://youtu.be/13CZPWmke6A?t=870)
**Lex Fridman:** Do you think recurrence will make a comeback? Well, some kind of recurrence, I think, very likely. Recurrent neural networks, for pros as they're typically thought of for processing sequences, I think it's also possible.

[14:43](https://youtu.be/13CZPWmke6A?t=883)
**Lex Fridman:** What is, to you, a recurrent neural network, and generally speaking, I guess, what is a recurrent neural network?

[14:54](https://youtu.be/13CZPWmke6A?t=894)
**Ilya Sutskever:** You have a neural network which maintains a high-dimensional hidden state, and then when an observation arrives, it updates its high-dimensional hidden state through its connections in some way.

[15:05](https://youtu.be/13CZPWmke6A?t=905)
**Lex Fridman:** So, do you think... you know, that's what, like, expert systems did, right? Symbolic AI, uh, the knowledge-based, growing a knowledge base, is maintaining a hidden state, which is its knowledge base, and is growing it by sequential processing. Do you think of it more generally in that way, or is it simply, is it the more constrained form that of a hidden state with certain kinds of gating units that we think of as today with LSTMs and that? 

**Ilya Sutskever:** I mean, the hidden state is technically what you described there, the hidden state that goes inside the LSTM or the RNN or something like this. But then, what should be contained, you know, if you want to make the expert system, um, analogy? I'm not... I mean, you could say that the knowledge is stored in the connections, and then the short-term processing is done in the hidden state.

[15:36](https://youtu.be/13CZPWmke6A?t=936)
**Lex Fridman:** yes. Could you say that? Yeah, so, do you think there's a future of building large-scale knowledge bases within the neural networks?

[16:05](https://youtu.be/13CZPWmke6A?t=965)
**Ilya Sutskever:** Definitely.

**Lex Fridman:** So, we're going to pause on that confidence because I want to explore that. Well, let me zoom back out and ask, back to the history of ImageNet. Neural networks have been around for many decades, as you mentioned.

## Key ideas that led to success of deep learning

[16:22](https://youtu.be/13CZPWmke6A?t=982)
**Lex Fridman:** What do you think were the key ideas that led to their success? That ImageNet moment and beyond, the success in the past 10 years.

[16:38](https://youtu.be/13CZPWmke6A?t=998)
**Ilya Sutskever:** Okay, so the question is, to make sure I didn't miss anything, the key ideas that led to the success of deep learning over the past 10 years.

**Lex Fridman:** exactly, even though the fundamental thing behind deep learning has been around for much longer.

**Ilya Sutskever:** So, the key idea about deep learning, or rather the key fact about deep learning before deep learning started to be successful, is that it was underestimated.

[17:04](https://youtu.be/13CZPWmke6A?t=1024)
**Ilya Sutskever:** People who worked in machine learning simply didn't think that neural networks could do much. People didn't believe that large neural networks could be trained. People thought that, well, there was a lot of debate going on in machine learning about what are the right methods and so on.

[17:16](https://youtu.be/13CZPWmke6A?t=1036)
**Ilya Sutskever:** And people were arguing because there were no benchmarks which were truly hard, that if you do really well in them, then you can say, "Look, here is my system." That's when you switch from that's when this field becomes a little bit more of an engineering field.

[17:38](https://youtu.be/13CZPWmke6A?t=1058)
**Ilya Sutskever:** So, in terms of deep learning, to answer the question directly, the ideas were all there. The thing that was missing was a lot of supervised data and a lot of compute. Once you have a lot of supervised data and a lot of compute, then there is a third thing which is needed as well, and that is conviction.

[17:57](https://youtu.be/13CZPWmke6A?t=1077)
**Ilya Sutskever:** Conviction that if you take the right stuff which already exists and apply and mix it with a lot of data and a lot of compute, that it will, in fact, work. And so that was the missing piece. It was, you had the data, you needed the compute, which showed up in terms of GPUs.

[18:14](https://youtu.be/13CZPWmke6A?t=1094)
**Ilya Sutskever:** And you needed the conviction to realize that you need to mix them together. 

**Lex Fridman:** So, that's really interesting. So, uh, I guess the presence of compute and the presence of supervised data allowed the empirical evidence to do the convincing of the majority of the computer science community.  Right, and then there's Jeffrey Hinton that was the opposite of skeptical, and there was a convincing moment. And I think ImageNet served as that moment. 

**Ilya Sutskever:** That's right. 

**Lex Fridman:** And they represented this kind of... were the big pillars of the computer vision community, kind of the wizards got together, and then all of a sudden, there was a shift. And it's not enough for the ideas to all be there and the compute to be there. It's for it to convince the cynicism that existed. That it's interesting that people just didn't believe for a couple of decades.

[19:18](https://youtu.be/13CZPWmke6A?t=1158)
**Ilya Sutskever:** Yeah, well, but it's more than that. It's kind of been put this way, it sounds like, "Well, you know, those silly people who didn't believe, what were they missing?" But in reality, things were confusing because neural networks really did not work on anything, and they were not the best method on pretty much anything as well.

[19:30](https://youtu.be/13CZPWmke6A?t=1170)
**Ilya Sutskever:** And it was pretty rational to say, "Yeah, this stuff doesn't have any traction." And that's why you need to have these very hard tasks which are, which produce undeniable evidence. And that's how we make progress, and that's why the field is making progress today because we have these hard benchmarks which represent true progress.

## What's harder to solve: language or vision?

[20:00](https://youtu.be/13CZPWmke6A?t=1200)
**Lex Fridman:** So, incredibly, you've contributed to some of the biggest recent ideas in AI, in computer vision, language, natural language processing, reinforcement learning, sort of everything in between.

[20:11](https://youtu.be/13CZPWmke6A?t=1211)
**Lex Fridman:** Maybe not GANs. Is there, there may not be a topic you haven't touched. And, of course, the fundamental science of deep learning. What is the difference to you between vision, language, and, as in reinforcement learning, action as learning problems? And what are the commonalities? Do you see them as all interconnected? Are they fundamentally different domains that require different approaches?

[20:39](https://youtu.be/13CZPWmke6A?t=1239)
**Ilya Sutskever:** Okay, that's a good question. Machine learning is a field with a lot of unity. A huge amount of unity. 

**Lex Fridman:** What do you mean by unity? Like overlap of ideas?

**Ilya Sutskever:** Overlap of ideas, overlap of principles. In fact, there is only one or two or three principles which are very, very simple, and then they apply in almost the same way to the different modalities, to the different problems.

[21:03](https://youtu.be/13CZPWmke6A?t=1263)
**Ilya Sutskever:** And that's why today, when someone writes a paper on improving optimization of deep learning in vision, it improves the different NLP applications, and it improves the different reinforcement learning applications. Reinforcement learn... So, I would say that computer vision and NLP are very similar to each other today. They differ in that they have slightly different architectures. We use transformers in NLP and use convolutional neural networks in vision.

[21:27](https://youtu.be/13CZPWmke6A?t=1287)
**Ilya Sutskever:** But it's also possible that one day this will change, and everything will be unified with a single architecture. Because if you go back a few years ago in natural language processing, there were a huge number of architectures for every different tiny problem had its own architecture. Today, this is just one transformer for all those different tasks.

[21:51](https://youtu.be/13CZPWmke6A?t=1311)
**Ilya Sutskever:** And if you go back in time even more, you had even more and more fragmentation, and every little problem in AI had its own little sub-specialization and sub, you know, little set of collection of skills, people who would know how to engineer the features. Now, it's all been subsumed by deep learning. We have this unification.

[22:04](https://youtu.be/13CZPWmke6A?t=1324)
**Ilya Sutskever:** And so, I expect vision to become unified with natural language as well, or rather, I shouldn't say expect, I think it's possible. I don't want to be too sure, because I think convolutional neural net is very computationally efficient.

[22:15](https://youtu.be/13CZPWmke6A?t=1335)
**Ilya Sutskever:** RL (Reinforcement Learning) is different. RL does require slightly different techniques because you really do need to take action. You really do need to do something about exploration; your variance is much higher. But I think there is a lot of unity even there, and I would expect, for example, that at some point there will be some broader unification between RL and supervised learning where somehow the RL will be making decisions to make the supervised learning go better, and it will be, I imagine, one big black box, and you just throw everything, you know, you shovel things into it, and it just figures out what to do with whatever you shovel it.

[22:50](https://youtu.be/13CZPWmke6A?t=1370)
**Lex Fridman:** I mean, reinforcement learning has some aspects of language and vision combined, almost. There's elements of a long-term memory that you should be utilizing, and there's elements of a really rich sensory space. So, it seems like it's the union of the two, or something like that.

[23:09](https://youtu.be/13CZPWmke6A?t=1389)
**Ilya Sutskever:** I'd say something slightly differently. I'd say that reinforcement learning is neither, but it naturally interfaces and integrates with the two of them.

[23:24](https://youtu.be/13CZPWmke6A?t=1404)
**Lex Fridman:** Do you think action is fundamentally different? So, what is unique about the policy of learning to act?

[23:30](https://youtu.be/13CZPWmke6A?t=1410)
**Ilya Sutskever:** Well, one example, for instance, is that when you learn to act, you are fundamentally in a non-stationary world because as your actions change, the things you see start changing. You experience the world in a different way, and this is not the case for the more traditional static problem where you have at least some distribution and you just apply a model to that distribution.

[23:52](https://youtu.be/13CZPWmke6A?t=1432)
**Lex Fridman:** Do you think it's a fundamentally different problem, or is it just a more difficult generalization of the problem of understanding?

[24:04](https://youtu.be/13CZPWmke6A?t=1444)
**Ilya Sutskever:** I mean, it's, it's a question of definitions almost. There is a huge amount of commonality for sure. You take gradients, you try to approximate gradients in both cases. In the case of reinforcement learning, you have some tools to reduce the variance of the gradients. You do that. There's lots of commonality; you use the same neural net in both cases. You compute the gradient, you apply Adam in both cases. So, I mean, there's lots in common for sure, but there are some small differences which are not completely insignificant. It's really just a matter of your point of view what frame of reference you what how much do you want to zoom in or out as you look at these problems. 

[24:46](https://youtu.be/13CZPWmke6A?t=1486)
**Lex Fridman:** Which problem do you think is harder? So, people like Noam Chomsky believe that language is fundamental to everything, so it underlies everything. Do you think language understanding is harder than visual scene understanding, or vice versa?

[25:06](https://youtu.be/13CZPWmke6A?t=1506)
**Ilya Sutskever:** I think that asking if a problem is hard is slightly wrong. I think the question is a little bit wrong, and I want to explain why. So, what does it mean for a problem to be hard? 

**Lex Fridman:** The non-interesting, dumb answer to that is there's this benchmark, and there's a human level performance on that benchmark, and there's the effort required to reach the human level.

**Ilya Sutskever:** So, from the perspective of how much until we get to human level 

**Lex Fridman:** on a very good benchmark...

[25:46](https://youtu.be/13CZPWmke6A?t=1546)
**Ilya Sutskever:** Yeah, like some... I understand what you mean by that. So, what I was going to say is that a lot of it depends on, you know, once you solve a problem, it stops being hard, and that's always true. And so, whether something is hard or not depends on what our tools can do today. So, you know, you say today, true human-level language understanding and visual perception are hard in the sense that there is no way of solving the problem completely in the next three months. Right, so I agree with that statement. Beyond that, I'm just... I'll be, my guess would be as good as yours, I don't know.

[25:59](https://youtu.be/13CZPWmke6A?t=1559)
**Lex Fridman:** Oh, okay, so you don't have a fundamental intuition about how hard language understanding is. 

**Ilya Sutskever:** I think I... I know, I changed my mind, let's say language is probably going to be harder. I mean, it depends on how you define it. Like if you mean absolute top-notch, 100% language understanding, I'll go with language. But then if I show you a piece of paper with letters on it, is that... You see what I mean? It's... You have a vision system, you say it's the best human-level vision system. I show you, I open a book, and I show you letters. Will it understand how these letters form into words and sentences and meaning? Is this part of the vision problem? Where does vision end, and language begin?

[26:52](https://youtu.be/13CZPWmke6A?t=1612)
**Lex Fridman:** Yeah, so Chomsky would say it starts at language. So, vision is just a little example of the kind of structure and, you know, fundamental hierarchy of ideas that's already represented in our brain somehow, that's represented through language. But where does vision stop and language begin? That's a really interesting question. It so one possibility is that it's impossible to achieve really deep understanding in either images or language without basically using the same kind of system. So, you're going to get the other for free. 

**Ilya Sutskever:** I think it's pretty likely that, yes, if we can get one, our machine learning is probably that good that we can get the other, but it's not 100%. I'm not 100% sure, and also, I think a lot of it really does depend on your definitions.

[28:04](https://youtu.be/13CZPWmke6A?t=1684)
**Lex Fridman:** Definitions of ...

**Ilya Sutskever:** ... of a perfect vision. Because reading is vision but should it count? 

**Lex Fridman:** My definition is that if the system looked at an image, a piece of text and then told me something about that, and I was really impressed. That's relative, you'll be impressed for half an hour, and then you're gonna say, "Well, I mean, all the systems do that." But here's the thing, they don't do...

[28:33](https://youtu.be/13CZPWmke6A?t=1713)
**Lex Fridman:** Yeah, but I don't have that with humans. Humans continue to impress me. 

**Ilya Sutskever:** Is that true? 

**Lex Fridman:** Well, the ones... Okay, so I'm a fan of monogamy, so I like the idea of marrying somebody, being with them for several decades. So, I believe in the fact that, yes, it's possible to have somebody continuously giving you pleasurable, interesting, witty new ideas, friends. Yeah, I think so. They continue to surprise you. The surprise, it's, um, you know, that injection of randomness seems to be a nice source of continued inspiration, like the wit, the humor. I think, yeah, that that would be a very subjective test, but I think if you have enough humans in the room, 

[29:00](https://youtu.be/13CZPWmke6A?t=1740)
**Ilya Sutskever:** Yeah, I feel like I misunderstood what you meant by impressing you. I thought you meant to impress you with its intelligence, with how well it understands an image. I thought you meant something like, "I'm going to show it a really complicated image, and it's going to get it right," and you're going to say, "Wow, that's really cool, systems of January 2020 have not been doing that."

[29:25](https://youtu.be/13CZPWmke6A?t=1765)
**Lex Fridman:** Yeah, no, I think it all boils down to like the reason people click like on stuff on the internet, which is like it makes them laugh, so it's like humor or wit. Yeah, or insight.

[29:39](https://youtu.be/13CZPWmke6A?t=1779)
**Ilya Sutskever:** I'm sure we'll get that as well. 

## We're massively underestimating deep learning

**Lex Fridman:** So forgive the romanticized question, but we're massively underestimating deep learning. Looking back to you, what is the most beautiful or surprising idea in deep learning or AI in general you've come across?

[29:52](https://youtu.be/13CZPWmke6A?t=1792)
**Ilya Sutskever:** So, I think the most beautiful thing about deep learning is that it actually works. And I mean it because you got these ideas, you got the little neural network, you got the backpropagation algorithm, and then you got some theories as to, you know, this is kind of like the brain, so maybe if you make it large, if you make the neural network large and you train it a lot of data, then it will do the same function as the brain does. And it turns out to be true. That's crazy. And now we just train these neural networks, and you make them larger, and they keep getting better, and I find it unbelievable. I find it unbelievable that this whole AI stuff with neural networks works.

[30:24](https://youtu.be/13CZPWmke6A?t=1824)
**Lex Fridman:** Have you built up an intuition of why? Are there little bits and pieces of intuitions of insights of why this whole thing works? 

**Ilya Sutskever:** I mean, definitely. While we know that optimization, we now have good, you know, we've taken, we've had lots of empirical reasons to believe that optimization should work on almost most problems we care about.

[30:54](https://youtu.be/13CZPWmke6A?t=1854)
**Lex Fridman:** Did you have insights of what? So, you just said empirical evidence is most of your sort of empirical evidence kind of convinces you. It's like evolution is empirical. It shows you that look, this evolutionary process seems to be a good way to design organisms that survive in their environment, but it doesn't really get you to the insides of how the whole thing works.

[31:13](https://youtu.be/13CZPWmke6A?t=1873)
**Ilya Sutskever:** I think it's a good analogy is physics, you know, how you say, "Hey, let's do some physics calculation and come up with some new physics theory, and make some prediction," but then you gotta run the experiment. You know, you gotta run the experiment. It's important. So, it's a bit the same here, except that maybe sometimes the experiment came before the theory. But it still is the case, you know, you have some data and you come up with some prediction. You say, "Yeah, let's make a big neural network, let's train it, and it's going to work much better than anything before it, and it will, in fact, continue to get better as you make it larger." And it turns out to be true. That's amazing when a theory is validated like this. You know, it's not a mathematical theory; it's more of a biological theory, almost.

[32:00](https://youtu.be/13CZPWmke6A?t=1920)
**Ilya Sutskever:** So, I think there are not terrible analogies between deep learning and biology. I would say it's like the geometric mean of biology and physics. That's deep learning.

[32:22](https://youtu.be/13CZPWmke6A?t=1942)
**Lex Fridman:** The geometric meaning of biology and physics. I think I'm going to need a few hours to wrap my head around that, because just to find the geometric, just to find the set of what biology represents...

[32:35](https://youtu.be/13CZPWmke6A?t=1955)
**Ilya Sutskever:** Well, biology, in biology, things are really complicated. Theories are really, really hard to have good predictive theory. And if, in physics, the theories are too good, in theory, in physics, people make these super precise theories which make these amazing predictions, and in machine learning, it's kind of in between.

[32:52](https://youtu.be/13CZPWmke6A?t=1972)
**Lex Fridman:** But it'd be nice if machine learning somehow helped us discover the unification of the two, as opposed to some of the in-between. But you're right, that's... you're kind of trying to juggle both. So, do you think there's still beautiful and mysterious properties in neural networks that are yet to be discovered?

[33:12](https://youtu.be/13CZPWmke6A?t=1992)
**Ilya Sutskever:** Definitely. I think that we are still massively underestimating deep learning. 

**Lex Fridman:** What do you think it will look like? Like, what.

**Ilya Sutskever:** if I knew, I would have done it.

[33:29](https://youtu.be/13CZPWmke6A?t=2009)
**Ilya Sutskever:** Yeah, so, uh, but if you look at all the progress from the past 10 years, I would say most of it, I would say there have been a few cases where some were things that felt like really new ideas showed up, but by and large, it was every year we thought, "Okay, deep learning goes this far. Nope, it actually goes further." And then the next year, "Okay, now, this is, this is peak deep learning. We are really done. Nope, goes further." It just keeps going further each year. So that means that we keep underestimating, we keep not understanding its surprising properties all the time.

[33:52](https://youtu.be/13CZPWmke6A?t=2032)
**Lex Fridman:** Do you think it's getting harder and harder to make progress, need to make progress?

[33:35](https://youtu.be/13CZPWmke6A?t=2015)
**Ilya Sutskever:** It depends on what we mean. I think the field will continue to make very robust progress for quite a while. I think for individual researchers, especially people who are doing research, it can be harder because there is a very large number of researchers right now. I think that if you have a lot of compute, then you can make a lot of very interesting discoveries, but then you have to deal with the challenge of managing a huge compute, a huge classic compute cluster trying to experiment. So, it's a little bit harder.

[34:06](https://youtu.be/13CZPWmke6A?t=2046)
**Lex Fridman:** So, I'm asking all these questions that nobody knows the answer to, but you're one of the smartest people I know, so I'm going to keep asking. So, let's imagine all the breakthroughs that happen in the next 30 years in deep learning. Do you think most of those breakthroughs can be done by one person with one computer? Sort of in the space of breakthroughs, do you think compute will be, compute and large efforts, will be necessary?

[34:38](https://youtu.be/13CZPWmke6A?t=2078)
**Ilya Sutskever:** I mean, I can't be sure. When you say one computer, you mean how large?

[34:47](https://youtu.be/13CZPWmke6A?t=2087)
**Lex Fridman:** You're clever. I mean one, can one GPU?

[34:52](https://youtu.be/13CZPWmke6A?t=2092)
**Ilya Sutskever:** I see. I think it's pretty unlikely. I think it's pretty unlikely. I think that there are many, the stack of deep learning is starting to be quite deep. If you look at it, you've got all the way from the ideas, the systems to build the datasets, the distributed programming, the building, the actual cluster, the GPU programming, putting it all together. So now, the stack is getting really deep, and I think it becomes, it can be quite hard for a single person to become, to be world-class in every single layer of the stack.

[35:16](https://youtu.be/13CZPWmke6A?t=2116)
**Lex Fridman:** What about the, what like Vladimir Vapnik really insists on, is taking MNIST and trying to learn from very few examples, so being able to learn more efficiently? Do you think that there'll be breakthroughs in that space that may not need the huge compute? 

[35:35](https://youtu.be/13CZPWmke6A?t=2135)
**Ilya Sutskever:** I think it will be a very... I think there will be a large number of breakthroughs in general that will not need a huge amount of compute. So maybe I should clarify that I think that some breakthroughs will require a lot of compute and I think building systems which actually do things will require a huge amount of compute. That one is pretty obvious; if you want to do X, right, and X requires a huge neural net, you got to get a huge neural net. But I think there will be lots of... I think there is lots of room for very important work being done by small groups and individuals.

## Deep double descent

[36:05](https://youtu.be/13CZPWmke6A?t=2165)
**Lex Fridman:** You may be, sort of on the topic of the science of deep learning, talk about one of the recent papers that you released, sure, that deep double descent, where bigger models and more data hurt. I think it's really interesting paper. Can you, can you describe the main idea and...

[36:24](https://youtu.be/13CZPWmke6A?t=2184)
**Ilya Sutskever:** Yeah, definitely. So, what happened is that some, over the years, some small number of researchers noticed that it is kind of weird that when you make the neural network larger, it works better, and it seems to go in contradiction with statistical ideas. And then some people made an analysis showing that actually you got this double descent bump. And what we've done was to show that double descent occurs for all for pretty much all practical deep learning systems, and that it'll be also...

[36:49](https://youtu.be/13CZPWmke6A?t=2209)
**Lex Fridman:** So, can you step back, uh, what's the x-axis and the y-axis of a double descent plot?

[36:55](https://youtu.be/13CZPWmke6A?t=2215)
**Ilya Sutskever:** Okay, great. So, you can look, you can do things like you can take a neural network and you can start increasing its size slowly while keeping your dataset fixed. So, if you increase the size of the neural network slowly and if you don't do early stopping, that's a pretty important detail, then when the neural network is really small, you make it larger, you get a very rapid increase in performance. Then you continue to make it large and at some point performance will get worse. And it gets the worst exactly at the point at which it achieves zero training error, precisely zero training loss. And then as you make it large, it starts to get better again, and it's kind of counter-intuitive because you'd expect deep learning phenomena to be monotonic.

[37:41](https://youtu.be/13CZPWmke6A?t=2261)
**Ilya Sutskever:** It's hard to be sure what it means, but it also occurs in the case of linear classifiers. And the intuition basically boils down to the following: When you have a large dataset and a small model, then small, tiny random things in your dataset, that's what overfitting is. Overfitting is when your model is very sensitive to the small, random, unimportant stuff in your training dataset. So, if you have a small model and a big dataset, there may be some random thing, some training cases are randomly in the dataset and others may not be there, but the small model is kind of insensitive to this randomness because it's, you know, there is pretty much no uncertainty about the model when it is large.

[38:35](https://youtu.be/13CZPWmke6A?t=2315)
**Lex Fridman:** So, okay, so at the very basic level, to me, it is the most surprising thing that neural networks don't overfit every time very quickly before ever being able to learn anything, the huge number of parameters. 

**Ilya Sutskever:** So, here, so there is one way, okay, so maybe, so let me try to give the explanation, maybe that will be that will work. So, you got a huge neural network, let's suppose you've got a huge number of parameters, and now let's pretend everything is linear, which is not, let's just pretend. Then there is this big subspace where a neural network achieves zero error, and SGD (Stochastic Gradient Descent) is going to find, approximately, the point with the smallest norm in that subspace. Okay, and that can also be proven to be insensitive to the small randomness in the data when the dimensionality is high.

[39:35](https://youtu.be/13CZPWmke6A?t=2375)
**Ilya Sutskever:** But when the dimensionality of the data is equal to the dimensionality of the model, then there is a one-to-one correspondence between all the datasets and the models. So, small changes in the dataset actually lead to large changes in the model, and that's why performance gets worse. So, this is the best explanation, more or less.

[39:53](https://youtu.be/13CZPWmke6A?t=2393)
**Lex Fridman:** So, then it would be good for the model to have more parameters, so to be bigger than the data. 

**Ilya Sutskever:** That's right, but only if you don't really stop. If you introduce early stopping, your regularization, you can make the double descent bump almost completely disappear.

[40:10](https://youtu.be/13CZPWmke6A?t=2410)
**Lex Fridman:** What is early stopping? 

**Ilya Sutskever:** Early stopping is when you train your model and you monitor your test, your validation performance, and then, if at some point, validation performance starts to get worse, you say, "Okay, let's stop training. If you're good, you're good enough."

[40:27](https://youtu.be/13CZPWmke6A?t=2427)
**Lex Fridman:** So, the magic happens after that moment. So, you don't want to do the early stopping. 

**Ilya Sutskever:** Well, if you don't do the early stopping, you get a very pronounced double descent.

[40:34](https://youtu.be/13CZPWmke6A?t=2434)
**Lex Fridman:** Do you have any intuition why this happens, 

**Ilya Sutskever:** Double descent or early stopping?

**Lex Fridman:** Double descent.

[40:40](https://youtu.be/13CZPWmke6A?t=2440)
**Ilya Sutskever:** Oh, yeah. So, I try... let's see, the intuition is basically this: When the dataset has as many degrees of freedom as the model, then there is a one-to-one correspondence between them, and so small changes to the dataset lead to noticeable changes in the model. So, your model is very sensitive to all the randomness. It is unable to discard it. Whereas it turns out that when you have a lot more data than parameters, or a lot more parameters than data, the resulting solution will be insensitive to small changes in the dataset.

[41:13](https://youtu.be/13CZPWmke6A?t=2473)
**Lex Fridman:** So, it's able to discard the small changes.

**Ilya Sutskever:** The randomness, exactly, the spurious correlation which you don't want.

## Backpropagation

[41:25](https://youtu.be/13CZPWmke6A?t=2485)
**Lex Fridman:** Jeff Hinton suggested we need to throw backpropagation away. We already kind of talked about this a little bit, but what do you think could be an alternative method of training neural networks?

[41:43](https://youtu.be/13CZPWmke6A?t=2503)
**Ilya Sutskever:** Well, the thing that he said precisely is that to the extent you can't find backpropagation in the brain, it's worth seeing if we can learn something from how the brain learns. But backpropagation is very useful, and we should keep using it.

[41:54](https://youtu.be/13CZPWmke6A?t=2514)
**Lex Fridman:** Oh, you're saying that once we discover the mechanism of learning in the brain or any aspects of that mechanism, we should also try to implement that in neural networks?

[42:00](https://youtu.be/13CZPWmke6A?t=2520)
**Ilya Sutskever:** If it turns out that we can't find backpropagation in the brain.

**Lex Fridman:** If we can't find backpropagation in the brain. Well, so I guess your answer to that is backpropagation is pretty damn useful, so why are we complaining?

[42:17](https://youtu.be/13CZPWmke6A?t=2537)
**Ilya Sutskever:** I mean, I personally am a big fan of backpropagation. I think it's a great algorithm because it solves an extremely fundamental problem, which is finding a neural circuit subject to some constraints. And I don't see that problem going away. So, that's why I really think it's pretty unlikely that we'll have anything which is going to be dramatically different. It could happen, but I wouldn't bet on it right now.

## Can neural networks be made to reason?

[42:49](https://youtu.be/13CZPWmke6A?t=2569)
**Lex Fridman:** So, let me ask a sort of big-picture question. Do you think, can neural networks be made to reason?

[42:54](https://youtu.be/13CZPWmke6A?t=2574)
**Ilya Sutskever:** Why not? Well, if you look, for example, at AlphaGo or AlphaZero, the neural network of AlphaZero plays Go, which we all agree is a game that requires reasoning, better than 99.9% of all humans. Just the neural network, without the search, just the neural network itself, doesn't that give us an existence proof that neural networks can reason?

[43:20](https://youtu.be/13CZPWmke6A?t=2600)
**Lex Fridman:** To push back and disagree a little bit, we all agree that Go is reasoning. I think I agree. I don't think it's a trivial... Obviously, reasoning, like intelligence, is a loose, gray area term. A little bit, maybe you disagree with that. But yes, I think it has some of the same elements of reasoning. Reasoning is almost akin to search, right? There's a sequential element of stepwise consideration of possibilities, and sort of building on top of those possibilities in a sequential manner until you arrive at some insight.

[43:57](https://youtu.be/13CZPWmke6A?t=2637)
**Lex Fridman:** So yeah, I guess playing Go is kind of like that, and when you have a single neural network doing that without search, that's kind of like that. So, there's an existence proof in a particular constrained environment that a process akin to what many people call reasoning exists. But more general kind of reasoning, so off the board.

**Ilya Sutskever:** there is one other existence... 

**Lex Fridman:** oh boy, which one? Us, humans. 

**Ilya Sutskever:** Yes.

**Lex Fridman:** okay, alright.

[44:26](https://youtu.be/13CZPWmke6A?t=2666)
**Lex Fridman:** So, do you think the architecture that will allow neural networks to reason will look similar to the neural network architectures we have today?

[44:38](https://youtu.be/13CZPWmke6A?t=2678)
**Ilya Sutskever:** I think it will. I think, well, I don't want to make too overly definitive statements. I think it's definitely possible that the neural networks that will produce the reasoning breakthroughs of the future will be very similar to the architectures that exist today, maybe a little bit more current, maybe a little bit deeper. But these neural networks are so insanely powerful. Why wouldn't they be able to learn to reason? Humans can reason, so why can't neural networks?

[45:13](https://youtu.be/13CZPWmke6A?t=2713)
**Lex Fridman:** So, do you think the kind of stuff we've seen neural networks do is a kind of just weak reasoning? So, it's not a fundamentally different process? Again, this is stuff we don't, nobody knows the answer to.

[45:24](https://youtu.be/13CZPWmke6A?t=2724)
**Ilya Sutskever:** So, when it comes to our neural networks, I would think, which I would say is that neural networks are capable of reasoning, but if you train a neural network on a task which doesn't require reasoning, it's not going to reason. This is a well-known effect where the neural network will solve exactly the problem that you pose in front of it in the easiest way possible.

[45:54](https://youtu.be/13CZPWmke6A?t=2754)
**Lex Fridman:** Right, that takes us to the, to one of the brilliant sort of ways you describe neural networks, which is you refer to neural networks as the search for small circuits, and maybe general intelligence as the search for small programs, which I found is a metaphor very compelling. Can you elaborate on that difference?

[46:13](https://youtu.be/13CZPWmke6A?t=2773)
**Ilya Sutskever:** Yeah, so the thing which I said precisely was that if you can find the shortest program that outputs the data in your disposal, then you will be able to use it to make the best prediction possible. And that's a theoretical statement which can be proven mathematically. Now, you can also prove mathematically that it is that finding the shortest program which generates some data is not a computable operation. No finite amount of compute can do this.

[46:46](https://youtu.be/13CZPWmke6A?t=2806)
**Ilya Sutskever:** So, then with neural networks, neural networks are the next best thing that actually works in practice. We are not able to find the best, the shortest program which generates our data, but we are able to find, you know, a small, but now, now that statement should be amended. Even a large circuit which fits our data in some way.

**Lex Fridman:** Well, I think what you meant by this small circuit is the smallest needed circuit.

[47:11](https://youtu.be/13CZPWmke6A?t=2831)
**Ilya Sutskever:** Well, I see. The thing which I would change now, back then, I really haven't fully internalized the overparameterization, the overparameterized results, the things we know about overparameterized neural nets. Now, I would phrase it as a large circuit that, whose weights contain a small amount of information, which I think is what's going on.

[47:36](https://youtu.be/13CZPWmke6A?t=2856)
**Ilya Sutskever:** If you imagine the training process of a neural network as you slowly transmit entropy from the dataset to the parameters, then somehow the amount of information in the weights ends up being not very large, which would explain why they generalized so well.

[47:48](https://youtu.be/13CZPWmke6A?t=2868)
**Lex Fridman:** So, that the large circuit might be one that's helpful for the regulation, for the generalization.

[47:54](https://youtu.be/13CZPWmke6A?t=2874)
**Ilya Sutskever:** Yeah, some of this. 

**Lex Fridman:** But do you see it important to be able to try to learn something like programs?

[48:05](https://youtu.be/13CZPWmke6A?t=2885)
**Ilya Sutskever:** I mean, if you can, definitely. I think the answer is kind of yes. If we can do it, we should do things that we can do. It's the reason we are pushing on deep learning. The fundamental reason, the cause, the root cause, is that we are able to train them. So, in other words, training comes first. We've got our pillar, which is the training pillar, and now we are trying to contort our neural networks around the training pillar. We got to stay trainable. This is an invariant we cannot violate. And so ...

[48:41](https://youtu.be/13CZPWmke6A?t=2921)
**Lex Fridman:** Being trainable means starting from scratch, knowing nothing, you can actually pretty quickly converge towards knowing a lot.

**Ilya Sutskever:** ... or even slowly, but it means that given the resources at your disposal, you can train the neural net and get it to achieve useful performance. 

**Lex Fridman:** Yeah, that's a pillar we can't move away from.

[48:59](https://youtu.be/13CZPWmke6A?t=2939)
**Ilya Sutskever:** That's right. Because if you can... Whereas if you say, "Hey, let's find the shortest program," but we can't do that, so it doesn't matter how useful that would be, we can't do it. So, we want...

[49:14](https://youtu.be/13CZPWmke6A?t=2954)
**Lex Fridman:** So, do you think, you kind of mentioned that neural networks are good at finding small circuits or large circuits. Do you think then the matter of finding small programs is just the data? 

**Ilya Sutskever:** No.

[49:20](https://youtu.be/13CZPWmke6A?t=2960)
**Lex Fridman:** Sorry, not the size or character, the quality, the type of data. Sort of asking it programs?

[49:27](https://youtu.be/13CZPWmke6A?t=2967)
**Ilya Sutskever:** Well, I think the thing is that right now, finding... There are no good precedents of people successfully finding programs really well. And so, the way you'd find programs is you'd train a deep neural network to do it, basically. Right, which is the right way to go about it. 

**Lex Fridman:** But there's not good illustrations that ...

**Ilya Sutskever:** ... it hasn't been done yet, but in principle, it should be possible.

[49:58](https://youtu.be/13CZPWmke6A?t=2998)
**Lex Fridman:** Can you elaborate a little bit? What's your insight in principle? And put another way, you don't see why it's not possible?

[50:03](https://youtu.be/13CZPWmke6A?t=3003)
**Ilya Sutskever:** Well, it's kind of like more... It's more a statement of, I think that it's unwise to bet against deep learning. And if it's a cognitive function that humans seem to be able to do, then it doesn't take too long for some deep neural net to pop up that can do it too.

[50:22](https://youtu.be/13CZPWmke6A?t=3022)
**Lex Fridman:** Yeah, I'm there with you. I've stopped betting against neural networks at this point, because they continue to surprise us.

## Long-term memory

[50:38](https://youtu.be/13CZPWmke6A?t=3038)
**Lex Fridman:** What about long-term memory? Can neural networks have long-term memory or something like knowledge bases, so being able to aggregate important information over long periods of time that would then serve as useful sort of representations of state that you can make decisions by? So, have a long-term context based on what you make in the decision.

[51:04](https://youtu.be/13CZPWmke6A?t=3064)
**Ilya Sutskever:** So, in some sense, the parameters already do that. The parameters are an aggregation of the day of the neural network's entirety of experience, and so they count as the long-term knowledge. And people have trained various neural nets to act as knowledge bases, and you know, investigated, people have investigated language models as knowledge bases. So, there is work there.

[51:27](https://youtu.be/13CZPWmke6A?t=3087)
**Lex Fridman:** But in some sense, do you think in every sense, do you think it's all just a matter of coming up with a better mechanism of forgetting the useless stuff and remembering the useful stuff? Because right now, I mean, there's not been mechanisms that do remember really long-term information.

[51:45](https://youtu.be/13CZPWmke6A?t=3105)
**Ilya Sutskever:** What do you mean by that precisely?

[51:54](https://youtu.be/13CZPWmke6A?t=3114)
**Lex Fridman:** I like the word precisely. So, I'm thinking of the kind of compression of information, the knowledge bases represent. Sort of creating a ... Now I apologize for my sort of human-centric thinking about what knowledge is because neural networks aren't interpretable necessarily with the kind of knowledge they have discovered. But a good example for me is knowledge bases being able to build up over time something like the knowledge that wikipedia represents. It's a really compressed structured knowledge base obviously not the actual wikipedia or the language but like semantic web, the dream that semantic web represented. It's a really nice compressed knowledge base or something akin to that in the non-interpretable sense as neural networks would have.

[52:44](https://youtu.be/13CZPWmke6A?t=3164)
**Ilya Sutskever:** Well, the neural networks would be non-interpretable if you look at their weights, but their outputs should be very interpretable.

[52:55](https://youtu.be/13CZPWmke6A?t=3175)
**Lex Fridman:** How do you make very smart neural networks like language models interpretable?

[53:01](https://youtu.be/13CZPWmke6A?t=3181)
**Ilya Sutskever:** Well, you ask them to generate some text, then the text will generally be interpretable.

[53:07](https://youtu.be/13CZPWmke6A?t=3187)
**Lex Fridman:** Do you find that the epitome of interpretability? Like, can you do better? Can you... Because you can't... Okay, I'd like to know what does it know and what doesn't know. I would like the neural network to come up with examples where it's completely dumb and examples where it's completely brilliant. And the only way I know how to do that now is to generate a lot of examples and use my human judgment. But it would be nice if a neural network had some self-awareness about it.

[53:30](https://youtu.be/13CZPWmke6A?t=3210)
**Ilya Sutskever:** Yeah, 100%. I'm a big believer in self-awareness, and I think that neural network self-awareness will allow for things like the capabilities like the ones you describe, like for them to know what they know and what they don't know, and for them to know where to invest to increase their skills most optimally. And to your question of interpretability, there are actually two answers to that question. One answer is, you know, we have the neural net, so we can analyze the neurons and we can try to understand what the different neurons and different layers mean. And you can actually do that, and OpenAI has done some work on that. But there is a different answer, which is, I would say, this is the human-centric answer, where you say, you know, you look at a human being, you can't read... You know, how do you know what a human being is thinking? And you ask them. You say, "Hey, what do you think about this? What do you think about that?" And you get some answers.

[54:22](https://youtu.be/13CZPWmke6A?t=3262)
**Lex Fridman:** The answers you get are sticky in the sense you already have a mental model, you already have an understanding of, like, a big conception of that human being, how they think, what they know, how they see the world. And then everything you ask, you're adding on to that. And that stickiness seems to be one of the really interesting qualities of the human being, is that information is sticky. You seem to remember the useful stuff, aggregate it well, and forget most of the information that's not useful.

[55:05](https://youtu.be/13CZPWmke6A?t=3305)
**Lex Fridman:** That process... But that's also pretty similar to the process that neural networks do. It's just that neural networks are so much crappier at it at this time. It doesn't seem to be fundamentally that different. But just to stick on reasoning for a little longer, you said, "Why not? Why can't it reason?" What's a good, impressive feat or benchmark to you of reasoning?

[55:34](https://youtu.be/13CZPWmke6A?t=3334)
**Ilya Sutskever:** Well, I think writing really good code. I think proving really hard theorems, solving open-ended problems with out-of-the-box solutions

**Lex Fridman:** and sort of theorem-type mathematical problems. 

**Ilya Sutskever:** Yeah, I think those ones are a very natural example as well. You know, if you can prove an unproven theorem, then it's hard to argue it doesn't reason.

[56:03](https://youtu.be/13CZPWmke6A?t=3363)
**Ilya Sutskever:** And so, by the way, and this comes back to the point about the hard results. You know, if you got a hard... If you have machine learning, deep learning as a field is very fortunate because we have the ability to sometimes produce these unambiguous results. And when they happen, the debate changes, the conversation changes. It's a conversa... We have the ability to produce conversation-changing results.

[56:21](https://youtu.be/13CZPWmke6A?t=3381)
**Lex Fridman:** And then, of course, just like you said, people kind of take that for granted and say, "That wasn't actually a hard problem." 

**Ilya Sutskever:** Well, I mean, at some point, we'll probably run out of hard problems.

[56:31](https://youtu.be/13CZPWmke6A?t=3391)
**Ilya Sutskever:** Yeah, that whole mortality thing is kind of a sticky problem that we haven't quite figured out. Maybe we'll solve that one.

## Language models

[56:37](https://youtu.be/13CZPWmke6A?t=3397)
**Lex Fridman:** I think one of the fascinating things in your entire body of work, but also the work at OpenAI recently, one of the conversation changers has been in the world of language models. Can you briefly kind of try to describe the recent history of using neural networks in the domain of language and text?

[56:56](https://youtu.be/13CZPWmke6A?t=3416)
**Ilya Sutskever:** Well, there's been lots of history. I think the Elman network was a small tiny recurrent neural network applied to language back in the 80s, so the history is really, you know, fairly long, at least. And the thing that started, the thing that changed the trajectory of neural networks and language, is the thing that changed the trajectory of deep learning, and that's data and compute. So, suddenly you move from small language models which learn a little bit, and with language models in particular, there's a very clear explanation for why they need to be large to be good, because they're trying to predict the next word.

[57:34](https://youtu.be/13CZPWmke6A?t=3454)
**Ilya Sutskever:** So, when you don't know anything, you'll notice very broad stroke surface level patterns, like sometimes there are characters and there is a space between those characters. You'll notice this pattern, and you'll notice that sometimes there is a comma and then the next character is a capital letter. You'll notice that pattern. Eventually, you may start to notice that certain words occur often, you may notice that spellings are a thing, you may notice syntax, and when you get really good at all these, you start to notice the semantics. You start to notice the facts but for that to happen the language model needs to be larger.

[58:11](https://youtu.be/13CZPWmke6A?t=3491)
**Lex Fridman:** Let's linger on that because that's where you and Noam Chomsky could disagree. So, you think we're actually taking incremental steps. A sort of larger network, larger compute, will be able to get to the semantics, to be able to understand language without what Noam likes to sort of think of as a fundamental understanding of the structure of language, like imposing your theory of language onto the learning mechanism. So, you're saying the learning, you can learn from raw data, the mechanism that underlies language?

[58:56](https://youtu.be/13CZPWmke6A?t=3536)
**Ilya Sutskever:** Well, I think it's pretty likely. But I also want to say that I don't really know precisely what Chomsky means when he talks about him, you said something about imposing your structure and language. I'm not 100% sure what he means, but empirically it seems that when you inspect those larger language models, they exhibit signs of understanding the semantics, whereas the smaller language models do not.

[59:22](https://youtu.be/13CZPWmke6A?t=3562)
**Ilya Sutskever:** We've seen that a few years ago when we did work on the sentiment neuron. We trained a small, you know, smaller LSTM to predict the next character in Amazon reviews, and we noticed that when you increase the size of the LSTM from 500 LSTM cells to 4000 LSTM cells, then one of the neurons starts to represent the sentiment of the article, of the story, of the review. Now, why is that? Sentiment is a pretty semantic attribute. It's not a syntactic attribute.

[59:51](https://youtu.be/13CZPWmke6A?t=3591)
**Lex Fridman:** And for people who might not know, I don't know if that's a standard term, but sentiment is whether it's a positive or negative review. 

**Ilya Sutskever:** That's right. Like, is the person happy with something? Is the person unhappy with something? And so, here we had very clear evidence that a small neural net does not capture sentiment, while a large neural net does.

[1:00:06](https://youtu.be/13CZPWmke6A?t=3606)
**Ilya Sutskever:** And why is that? Well, our theory is that at some point, you run out of syntax to model. You start gotta focus on something else. And with size, you quickly run out of syntax to model, and then you really start to focus on the semantics, would be the idea.

[1:00:25](https://youtu.be/13CZPWmke6A?t=3625)
**Ilya Sutskever:** That's right. And so, I don't want to imply that our models have complete semantic understanding because that's not true, but they definitely are showing signs of semantic understanding, partial semantic understanding. But the smaller models do not show those signs.

## GPT-2

[1:00:36](https://youtu.be/13CZPWmke6A?t=3636)
**Lex Fridman:** Can you take a step back and say what is GPT-2, which is one of the big language models that was the conversation changer in the past couple of years?

[1:00:48](https://youtu.be/13CZPWmke6A?t=3648)
**Ilya Sutskever:** Yes. So, GPT-2 is a transformer with one and a half billion parameters that was trained on about 40 billion tokens of text, which were obtained from web pages that were linked to from Reddit articles with more than three upvotes.

[1:01:05](https://youtu.be/13CZPWmke6A?t=3665)
**Lex Fridman:** And what's the transformer?

[1:01:11](https://youtu.be/13CZPWmke6A?t=3671)
**Ilya Sutskever:** The transformer is the most important advance in neural network architectures in recent history. 

**Lex Fridman:** What is attention, maybe too? Because I think that's the interesting idea, not necessarily sort of technically speaking, but the idea of attention versus maybe what recurring neural networks represent.

[1:01:29](https://youtu.be/13CZPWmke6A?t=3689)
**Ilya Sutskever:** Yeah, so the thing is, the transformer is a combination of multiple ideas simultaneously, of which attention is one.

**Lex Fridman:** Do you think attention is the key? 

**Ilya Sutskever:** No, it's a key, but it's not the key. The transformer is successful because it is the simultaneous combination of multiple ideas, and if you were to remove either idea, it would be much less successful.

[1:01:53](https://youtu.be/13CZPWmke6A?t=3713)
**Ilya Sutskever:** So the transformer uses a lot of attention, but attention existed for a few years, so that can't be the main innovation. The transformer is designed in such a way that it runs really fast on the GPU, and that makes a huge amount of difference. This is one thing.

[1:01:59](https://youtu.be/13CZPWmke6A?t=3719)
**Ilya Sutskever:** The second thing is, the transformer is not recurrent, and that is really important too, because it is more shallow and therefore much easier to optimize. So, in other words, it uses attention, it is a really great fit to the GPU, and it is not recurrent, so therefore less deep and easier to optimize. And the combination of those factors make it successful. So now it makes great use of your GPU, it allows you to achieve better results for the same amount of compute, and that's why it's successful.

[1:02:34](https://youtu.be/13CZPWmke6A?t=3754)
**Lex Fridman:** Were you surprised how well transformers worked and GPT-2 worked? So, you worked on language, you've had a lot of great ideas before transformers came about in language. So, you got to see the whole set of revolutions before and after. Were you surprised?

[1:02:51](https://youtu.be/13CZPWmke6A?t=3771)
**Ilya Sutskever:** Yeah, a little. 

**Lex Fridman:** A little, huh. 

**Ilya Sutskever:** Yeah. I mean, it's hard to remember because you adapt really quickly, but it definitely was surprising. It definitely was. In fact, I'll, you know what, I'll retract my statement. It was pretty amazing. It was just amazing to see it generate this text of this... And you know, you got to keep in mind that we've seen at that time we've seen all this progress in GANs in improving, you know, the samples produced by GANs were just amazing, you have these realistic faces. But text hasn't really moved that much, and suddenly we moved from whatever GANs were in 2015 to the best, most amazing GANs in one step, right? And it was really stunning, even though theory predicted, yeah, you train a big language model, of course, you should get this, but then to see it with your own eyes, it's something else.

[1:03:25](https://youtu.be/13CZPWmke6A?t=3805)
**Lex Fridman:** And yet we adapt really quickly. And now there's sort of some cognitive scientists write articles saying that GPT-2 models don't truly understand language. So, we adapt quickly to how amazing the fact that they're able to model the language so well is. So, what do you think is the bar...

**Ilya Sutskever:** For what?

**Lex Fridman:** ... for impressing us? 

**Ilya Sutskever:** That, I don't know. 

**Lex Fridman:** Do you think that bar will continuously be moved?

[1:04:04](https://youtu.be/13CZPWmke6A?t=3844)
**Ilya Sutskever:** Definitely. I think when you start to see really dramatic economic impact, that's when I think that's, in some sense, the next barrier. Because right now, if you think about the work in AI, it's really confusing. It's really hard to know what to make of all these advances. It's kind of like, okay, you got an advance, and now you can do more things, and you got another improvement, and you got another cool demo. At some point, I think people who are outside of AI, they can no longer distinguish this progress anymore.

[1:04:42](https://youtu.be/13CZPWmke6A?t=3882)
**Lex Fridman:** So, we were talking offline about translating Russian to English and how there's a lot of brilliant work in Russian that the rest of the world doesn't know about. That's true for Chinese, that's true for a lot of scientists and just artistic work in general. Do you think translation is the place where we're going to see sort of economic big impact?

[1:05:00](https://youtu.be/13CZPWmke6A?t=3900)
**Ilya Sutskever:** I don't know. I think there is a huge number of... I mean, first of all, I would want to point out that translation already today is huge. I think billions of people interact with big chunks of the internet primarily through translation. So, translation is already huge and it's hugely, hugely positive too. I think self-driving is going to be hugely impactful, and that's, you know, it's unknown exactly when it happens, but again, I would not bet against deep learning. So I ...

[1:05:32](https://youtu.be/13CZPWmke6A?t=3932)
**Lex Fridman:** That's deep learning in general, but you think ..

**Ilya Sutskever:** Deep learning for self-driving.

[1:05:38](https://youtu.be/13CZPWmke6A?t=3938)
**Lex Fridman:** Yes, deep learning for self-driving. But I was talking about sort of language models. 

**Ilya Sutskever:** I see.

**Lex Fridman:** just to check, you're not seeing a connection between driving and language?

**Ilya Sutskever:** No.

**Lex Fridman:** Okay.

[1:05:50](https://youtu.be/13CZPWmke6A?t=3950)
**Ilya Sutskever:** All right. They both use neural nets. 

**Lex Fridman:** There'll be a poetic connection. I think there might be some, like you said, there might be some kind of unification towards a kind of multi-task transformers that can take on both language and vision tasks. That'd be an interesting unification.

[1:06:14](https://youtu.be/13CZPWmke6A?t=3974)
**Lex Fridman:** Now, let's see, what can I ask about GPT-2 more? 

**Ilya Sutskever:** It's simple, it's not much to ask. It's, so, you take a transformer, you make it bigger, you give it more data, and suddenly it does all those amazing things.

[1:06:28](https://youtu.be/13CZPWmke6A?t=3988)
**Lex Fridman:** Yeah, one of the beautiful things is that GPT, the transformers, are fundamentally simple to explain, to train. Do you think bigger will continue to show better results in language?

**Ilya Sutskever:** Probably.

[1:06:33](https://youtu.be/13CZPWmke6A?t=3993)
**Lex Fridman:** So, sort of like, what are the next steps with GPT-2, do you think?

[1:06:40](https://youtu.be/13CZPWmke6A?t=4000)
**Ilya Sutskever:** I mean, for sure, seeing what larger versions can do is one direction. Also, I mean, there are many questions. There's one question which I'm curious about, and that's the following. So, right now, GPT-2, so we feed all this data from the internet, which means that it needs to memorize all those random facts about everything in the internet. And it would be nice if the model could somehow use its own intelligence to decide what data it wants to study, accept, and what data it wants to reject. Just like people, people don't learn all data indiscriminately. We are super selective about what we learn, and I think this kind of active learning, I think, would be very nice to have.

[1:07:09](https://youtu.be/13CZPWmke6A?t=4029)
**Lex Fridman:** Yeah, listen, I love active learning, so...

## Active learning

[1:07:17](https://youtu.be/13CZPWmke6A?t=4037)
**Lex Fridman:** Let me ask, does the selection of data, can you just elaborate that a little bit more? Do you think the selection of data is, um... Like, I have this kind of sense that the optimization of how you select data, so the active learning process, is going to be a place for a lot of breakthroughs, even in the near future, because there hasn't been many breakthroughs there that are public. I feel like there might be private breakthroughs that companies keep to themselves because the fundamental problem has to be solved. If you want to solve self-driving, if you want to solve a particular task. But, do you, what do you think about the space in general?

[1:08:02](https://youtu.be/13CZPWmke6A?t=4082)
**Ilya Sutskever:** Yeah, so I think that for something like active learning, or in fact, for any kind of capability like active learning, the thing that it really needs is a problem. It needs a problem that requires it. It's very hard to do research about the capability if you don't have a task, because then what's going to happen is you will come up with an artificial task, get good results, but not really convince anyone. 

**Lex Fridman:** Right, like we're now past the stage where getting a result on MNIST, some clever formulation on MNIST will convince people.

[1:08:34](https://youtu.be/13CZPWmke6A?t=4114)
**Ilya Sutskever:** That's right. In fact, you could quite easily come up with a simple active learning scheme on MNIST and get a 10x speed up, but then so what? And I think that with active learning, there needs to be... Active learning will naturally arise as there are problems that require it pop up. That's how I would... That's my take on it.

[1:08:51](https://youtu.be/13CZPWmke6A?t=4131)
**Lex Fridman:** There's another interesting thing that OpenAI has brought up with GPT-2, which is ...

## Staged release of AI systems

[1:08:57](https://youtu.be/13CZPWmke6A?t=4137)
**Lex Fridman:** When you create a powerful artificial intelligence system, and it was unclear what kind of detrimental... Once you release GPT-2, what kind of detrimental effect it will have. Because if you have a model that can generate pretty realistic text, you can start to imagine that it would be used by bots and some way that we can't even imagine. So like, there's this nervousness about what it's possible to do. So you did a really brave and profound thing, which you started a conversation about this. Like, how do we release powerful artificial intelligence models to the public, if we do it at all? How do we privately discuss with other, even competitors, about how we manage the use of these systems and so on? So from that whole experience, you released a report on it, but in general, are there any insights that you've gathered from just thinking about this, about how you release models like this?

[1:10:05](https://youtu.be/13CZPWmke6A?t=4205)
**Ilya Sutskever:** I mean, I think that my take on this is that the field of AI has been in a state of childhood and now it's exiting that state and it's entering a state of maturity. What that means is that AI is very successful and also very impactful, and its impact is not only large but it's also growing. And so, for that reason, it seems wise to start thinking about the impact of our systems before releasing them, maybe a little bit too soon rather than a little bit too late. And with the case of GPT-2, like I mentioned earlier, the results really were stunning, and it seemed plausible, it didn't seem certain, it seemed plausible that something like GPT-2 could easily be used to reduce the cost of disinformation. And so there was a question of what's the best way to release it, and staged release seemed logical. A small model was released and there was time to see the many people use these models in lots of cool ways, they've been lots of really cool applications there haven't been any negative applications we know of and so eventually it was released. But also other people replicated similar models.

[1:11:16](https://youtu.be/13CZPWmke6A?t=4276)
**Lex Fridman:** That's an interesting question though, 'that we know of.' So in your view, staged release is, uh, at least part of the answer to the question of how do we... uh, what do we do once we create a system like this?

[1:11:28](https://youtu.be/13CZPWmke6A?t=4288)
**Ilya Sutskever:** It's part of the answer, yes.

[1:11:34](https://youtu.be/13CZPWmke6A?t=4294)
**Lex Fridman:** Is there any other insights, like say you don't want to release the model at all because it's useful to you for whatever the business is?

[1:11:42](https://youtu.be/13CZPWmke6A?t=4302)
**Ilya Sutskever:** Well, there are plenty of people who don't release models already.

**Lex Fridman:** Right. Of course. But is there some moral, ethical responsibility when you have a very powerful model to sort of communicate, like just as you said, when you had GPT-2, it was unclear how much it could be used for misinformation. It's an open question, and getting an answer to that might require that you talk to other really smart people that are outside of your particular group. Have you... Please tell me there's some optimistic pathway for people across the world to collaborate on these kinds of cases, or is it still really difficult from one company to talk to another company?

[1:12:21](https://youtu.be/13CZPWmke6A?t=4341)
**Ilya Sutskever:** So, it's definitely possible, it's definitely possible to discuss these kinds of models with colleagues elsewhere and to get their take on what's, on what to do.

[1:12:29](https://youtu.be/13CZPWmke6A?t=4349)
**Lex Fridman:** How hard is it, though?

**Ilya Sutskever:** I mean...

**Lex Fridman:** Do you see that happening?

[1:12:37](https://youtu.be/13CZPWmke6A?t=4357)
**Ilya Sutskever:** I think that's a place where it's important to gradually build trust between companies because ultimately all the AI developers are building technology which is going to be increasingly more powerful. And so, it's the way to think about it is that ultimately, we're only together.

[1:13:02](https://youtu.be/13CZPWmke6A?t=4382)
**Lex Fridman:** Yeah, it's, I tend to believe in the better angels of our nature, but I do hope that when you build a really powerful AI system in a particular domain, that you also think about the potential negative consequences. It's an interesting and scary possibility that it'll be a race for a AI development that would push people to close that development and not share ideas with others.

**Ilya Sutskever:** I don't love this i've been like a pure academic for 10 years I really like sharing ideas and it's fun it's exciting.

## How to build AGI?

[1:13:41](https://youtu.be/13CZPWmke6A?t=4421)
**Lex Fridman:** What do you think it takes to, let's talk about AGI a little bit, what do you think it takes to build a system of human-level intelligence? We talked about reasoning, we talked about long-term memory, but in general, what does it take, you think?

[1:13:53](https://youtu.be/13CZPWmke6A?t=4433)
**Ilya Sutskever:** Well, I can't be sure, but I think the deep learning plus maybe another small idea.

**Lex Fridman:** Do you think self-play will be involved?

[1:14:05](https://youtu.be/13CZPWmke6A?t=4445)
**Lex Fridman:** So, like, you've spoken about the powerful mechanism of self-play, where systems learn by sort of exploring the world in a competitive setting against other entities that are similarly skilled as them, and so incrementally improve in this way. Do you think self-play will be a component of building an AGI system?

[1:14:25](https://youtu.be/13CZPWmke6A?t=4465)
**Ilya Sutskever:** Yeah, so what I would say to build AGI, I think, is going to be deep learning plus some ideas, and I think self-play will be one of those ideas. I think that self-play has this amazing property that it can surprise us in truly novel ways. For example, like, we... I mean, pretty much every self-play system, both our Dota bot, I don't know if OpenAI had a release about multi-agent where you had two little agents who were playing hide and seek, and of course, also AlphaZero, they all produced surprising behaviors. They all produce behaviors that we didn't expect. They are creative solutions to problems, and that seems like an important part of AGI that our systems don't exhibit routinely right now, and so that's why I like this area.

[1:15:24](https://youtu.be/13CZPWmke6A?t=4524)
**Ilya Sutskever:** I like this direction because of its ability to surprise us.

**Lex Fridman:** To surprise us, and an AGI system would surprise us fundamentally.

**Ilya Sutskever:** Yes, but and to be precise, not just a random surprise, but to find a surprising solution to a problem that's also useful.

[1:15:42](https://youtu.be/13CZPWmke6A?t=4542)
**Lex Fridman:** Right now, a lot of the self-play mechanisms have been used in the game context, or at least in the simulation context. How much, how far along the path to AGI do you think will be done in simulation? How much faith, promise do you have in simulation versus having to have a system that operates in the real world, whether it's the real world of digital real world data or real world like actual physical world of robotics?

[1:16:18](https://youtu.be/13CZPWmke6A?t=4578)
**Ilya Sutskever:** I don't think it's an either/or. I think simulation is a tool, and it helps. It has certain strengths and certain weaknesses, and we should use it. 

**Lex Fridman:** Yeah, but okay, I understand that, that's true. But one of the criticisms of self-play, one of the criticisms of reinforcement learning, is one of the current power, its current results, while amazing, have been demonstrated in simulated environments or very constrained physical environments. Do you think it's possible to escape the simulated environments and be able to learn in non-simulated environments? Or do you think it's possible to also just simulate, in a photorealistic and physics realistic way, the real world in a way that we can solve real problems with self-play in simulation?

**Ilya Sutskever:** So, I think that transfer from simulation to the real world is definitely possible and has been exhibited many times by many different groups. It's been especially successful in vision.

[1:17:21](https://youtu.be/13CZPWmke6A?t=4641)
**Ilya Sutskever:** Also, OpenAI in the summer has demonstrated a robot hand which was trained entirely in simulation, in a certain way that allowed for successful transfer to occur.

[1:17:33](https://youtu.be/13CZPWmke6A?t=4653)
**Lex Fridman:** Is this, uh, for the Rubik's Cube? 

**Ilya Sutskever:** That's right.

**Lex Fridman:** I wasn't aware that it was trained in simulation.

[1:17:39](https://youtu.be/13CZPWmke6A?t=4659)
**Ilya Sutskever:** It was trained in simulation entirely.

**Lex Fridman:** Really? So, what, it wasn't in the physical... The hand wasn't trained?

[1:17:50](https://youtu.be/13CZPWmke6A?t=4670)
**Ilya Sutskever:** No, 100% of the training was done in simulation. And the policy that was learned in simulation was trained to be very adaptive, so adaptive that when you transfer it, it could very quickly adapt to the physical world. So, the kind of perturbations with the giraffe or whatever the heck it was, those weren't part of the simulation?

[1:18:08](https://youtu.be/13CZPWmke6A?t=4688)
**Ilya Sutskever:** Well, the simulation was trained to be robust to many different things, but not the kind of perturbations we've had in the video. So, it's never been trained with a glove, it's never been trained with a stuffed giraffe.

[1:18:21](https://youtu.be/13CZPWmke6A?t=4701)
**Lex Fridman:** So, in theory, these are novel perturbations.

**Ilya Sutskever:** Correct. It's not in theory, in practice.

**Lex Fridman:** Those are novel perturbations. Well, that's okay, that's a clean, small scale, but clean example of a transfer from the simulated world to the physical world.

[1:18:28](https://youtu.be/13CZPWmke6A?t=4708)
**Ilya Sutskever:** Yeah, and I will also say that I expect the transfer capabilities of deep learning to increase in general. And the better the transfer capabilities are, the more useful simulation will become because then you could experience something in simulation and then learn a moral of the story, which you could then carry with you to the real world, as humans do all the time when they play computer games.

[1:19:03](https://youtu.be/13CZPWmke6A?t=4743)
**Lex Fridman:** So, let me ask, sort of an embodied question, staying on AGI for a sec. Do you think AGI asks us that we need to have a body, we need to have some of those human elements of self-awareness, consciousness, sort of fear of mortalities, or self-preservation in the physical space, which comes with having a body?

[1:19:20](https://youtu.be/13CZPWmke6A?t=4760)
**Ilya Sutskever:** I think having a body will be useful. I don't think it's necessary, but I think it's very useful to have a body for sure because you can learn a whole new... you can learn things which cannot be learned without a body. But at the same time, I think that you can, if you don't have a body, you could compensate for it and still succeed.

[1:19:43](https://youtu.be/13CZPWmke6A?t=4783)
**Lex Fridman:** You think so?

[1:19:43](https://youtu.be/13CZPWmke6A?t=4783)
**Ilya Sutskever:** Yes. Well, if there is evidence for this, for example, there are many people who were born deaf and blind, and they were able to compensate for the lack of modalities. I'm thinking about Helen Keller specifically.

[1:20:01](https://youtu.be/13CZPWmke6A?t=4801)
**Lex Fridman:** So, even if you're not able to physically interact with the world... And if you're not able to... I mean, I actually was getting at, maybe let me ask, on the more particular, I'm not sure if it's connected to having a body or not, but the idea of consciousness, and a more constrained version of that is self-awareness. Do you think an AGI system should have consciousness? It's what we can't define, kind of whatever the heck you think consciousness is.

[1:20:21](https://youtu.be/13CZPWmke6A?t=4821)
**Ilya Sutskever:** Yeah, hard question to answer given how hard it is to define it. 

**Lex Fridman:** Do you think it's useful to think about? 

**Ilya Sutskever:** I mean, it's definitely interesting. It's fascinating. I think it's definitely possible that our assistants will be conscious.

[1:20:39](https://youtu.be/13CZPWmke6A?t=4839)
**Lex Fridman:** Do you think that's an emergent thing that just comes from the representation that's stored within neural networks? So, like, that it naturally just emerges when you become more and more, you're able to represent more and more of the world?

[1:20:51](https://youtu.be/13CZPWmke6A?t=4851)
**Ilya Sutskever:** Well, I'd say I'd make the following argument, which is humans are conscious, and if you believe that artificial neural nets are sufficiently similar to the brain, then there should at least exist artificial neural nets that should be conscious too.

[1:21:08](https://youtu.be/13CZPWmke6A?t=4868)
**Lex Fridman:** You're leaning on that existence proof pretty heavily. Okay, but it's just that, that's the best answer I can give.

[1:21:15](https://youtu.be/13CZPWmke6A?t=4875)
**Lex Fridman:** I know, I know. There's still an open question if there's not some magic in the brain that we're not... I mean, I don't mean a non-materialistic magic, but that the brain might be a lot more complicated and interesting than we give it credit for.

[1:21:27](https://youtu.be/13CZPWmke6A?t=4887)
**Ilya Sutskever:** If that's the case, then it should show up, and at some point, we will find out that we can't continue to make progress. But I think it's unlikely.

[1:21:44](https://youtu.be/13CZPWmke6A?t=4904)
**Lex Fridman:** We talk about consciousness, but let me talk about another poorly defined concept of intelligence. Again, we've talked about reasoning, we've talked about memory. What do you think is a good test of intelligence for you? Are you impressed by the test that Alan Turing formulated with the imitation game? Is there something in your mind that you will be deeply impressed by if a system was able to do?

[1:22:09](https://youtu.be/13CZPWmke6A?t=4929)
**Ilya Sutskever:** Lots of things. There are certain frontiers of capabilities today, and there exists things outside of that frontier, and I would be impressed by any such thing. For example, I would be impressed by a deep learning system which solves a very pedestrian task, like machine translation or computer vision, and never makes a mistake a human wouldn't make under any circumstances. I think that is something which have not yet been demonstrated and I would find it very impressive.

[1:22:46](https://youtu.be/13CZPWmke6A?t=4966)
**Lex Fridman:** Yeah. So right now, they make mistakes, and they might be more accurate than human beings, but they still make a different set of mistakes. 

**Ilya Sutskever:** My... my... I would gess that lot of the skepticism that some people have about deep learning is when they look at their mistakes and say, "Well, those mistakes make no sense. If you understood the concept, you wouldn't make that mistake." And I think that changing that would inspire me. That would be "yes, this is this.. this is... this is progress".

[1:23:19](https://youtu.be/13CZPWmke6A?t=4999)
**Lex Fridman:** Yeah, that's that's a really nice way to put it. But I also just don't like that human instinct to criticize a model as not intelligent. That's the same instinct as we do when we criticize any group of creatures as the other. Becuase it's very possible that GPT-2 is much smarter than human beings in many things.

[1:23:42](https://youtu.be/13CZPWmke6A?t=5022)
**Ilya Sutskever:** That's definitely true. It has a lot more breadth of knowledge.

**Lex Fridman:** Yes, breadth knowledge. And even perhaps depth on certain topics.

**Ilya Sutskever:** It's hard to judge what depth means, but there's definitely a sense in which humans don't make mistakes that these models do.

[1:24:09](https://youtu.be/13CZPWmke6A?t=5049)
**Lex Fridman:** Yes, the same is applied to autonomous vehicles, the same is probably going to continue being applied to a lot of artificial intelligence systems. We find... this is the annoying... this is the process of analyzing the progress of AI in the 21st century is the search for one case where the system fails in a big way where humans would not, and then many people writing articles about it. The public generally gets convinced that the system is not intelligent, and we pacify ourselves by thinking it's not intelligent because of this one anecdotal case, and this seems to continue happening.

[1:24:34](https://youtu.be/13CZPWmke6A?t=5074)
**Ilya Sutskever:** Yeah, I mean, there is truth to that, though. There are people also, I'm sure, that plenty of people are also extremely impressed by the system that exists today. But I think this connects to the earlier point we discussed, that it's just confusing to judge progress in AI. You know, you have a new robot demonstrating something; how impressed should you be? And I think people will start to be impressed once AI starts to really move the needle on the GDP.

## Question to AGI

[1:25:00](https://youtu.be/13CZPWmke6A?t=5100)
**Lex Fridman:** So, you're one of the people that might be able to create an AGI system here. Not you, but you and OpenAI. If you do create an AGI system, and you get to spend the evening with it, him, her, what would you talk about? Do you think the very first time?

[1:25:19](https://youtu.be/13CZPWmke6A?t=5119)
**Ilya Sutskever:** Well, the first time, I would just ask all kinds of questions and try to get it to make a mistake, and I would be amazed that it doesn't make mistakes, and just keep asking broad.

[1:25:33](https://youtu.be/13CZPWmke6A?t=5133)
**Lex Fridman:** What kind of questions do you think? Would they be factual, or would they be personal, emotional, psychological?

[1:25:41](https://youtu.be/13CZPWmke6A?t=5141)
**Ilya Sutskever:** All of that, yeah. 

**Lex Fridman:** Would you ask for advice? 

**Ilya Sutskever:** Definitely. I mean why... why would I limit myself talking to a system like this.

[1:25:56](https://youtu.be/13CZPWmke6A?t=5156)
**Lex Fridman:** Now again let me emphasize the fact that you truly are one of the people that might be in the room where this happens. Let me ask a profound question about um... I've just talked to a stalin historian. I've been talking to a lot of people who are studying power. Abraham Lincoln said, "Nearly all men can stand adversity, but if you want to test a man's character, give him power." I would say the power of the 21st century, maybe the 22nd but hopefully the 21st, would be the creation of an AGI system, and the people who have control, direct possession, and control of the AGI system.

[1:26:39](https://youtu.be/13CZPWmke6A?t=5199)
**Lex Fridman:** So, what do you think, after spending that evening having a discussion with the AGI system, what do you think you would do?

[1:26:55](https://youtu.be/13CZPWmke6A?t=5215)
**Ilya Sutskever:** Well, the ideal world I would like to imagine is one where humanity are like the board members of a company, where the AGI is the CEO. So, it would be... I would like ... The picture which I imagine is you have some kind of different entities, different countries or cities, and the people that live there vote for what the AGI that represents them should do, and then AGI that represents them goes and does it. I think a picture like that I find very appealing. And you could have multiple AGIs, you would have an AGI for a city, for a country, and it would be trying to, in effect, take the democratic process to the next level.

[1:27:40](https://youtu.be/13CZPWmke6A?t=5260)
**Lex Fridman:** And the board can always fire the CEO.

**Ilya Sutskever:** Essentially press the reset button and say "Please, re-randomize the parameters".

[1:27:54](https://youtu.be/13CZPWmke6A?t=5274)
**Lex Fridman:** Well, let me... That's actually, okay, that's a beautiful vision, I think, as long as it's possible to press the reset button. Do you think it will always be possible to press the reset button?

[1:27:59](https://youtu.be/13CZPWmke6A?t=5279)
**Ilya Sutskever:** So, I think that it's definitely possible to build... So, you're talking... So, the question that I really understand from you is, will we, as humans... humans, have control over the AI systems that they build? Yes, and my answer is, it's definitely possible to build AI systems which will want to be controlled by their humans.

[1:28:23](https://youtu.be/13CZPWmke6A?t=5303)
**Lex Fridman:** Wow, that's part of their... So, it's not just that they can't help but be controlled, but that's one of the objectives of their existence, is to be controlled.

**Ilya Sutskever:** In the same way that human parents generally want to help their children, they want their children to succeed. It's not a burden for them; they are excited to help the children and to feed them and to dress them and to take care of them. And I believe with the highest conviction that the same will be possible for an AGI. It will be possible to program an AGI to design it in such a way that it will have a similar deep drive that it will be delighted to fulfill, and the drive will be to help humans flourish.

[1:29:18](https://youtu.be/13CZPWmke6A?t=5358)
**Lex Fridman:** But let me take a step back to that moment where you create the AGI system. I think this is a really crucial moment, and between that moment and the democratic board members with the AGI at the head, there has to be a relinquishing of power.

[1:29:38](https://youtu.be/13CZPWmke6A?t=5378)
**Lex Fridman:** So George Washington, despite all the bad things he did, one of the big things he did is he relinquished power. He first of all didn't want to be president, and even when he became president, he gave... He didn't keep just serving as most dictators do for indefinitely. Do you see yourself being able to relinquish control over an AGI system, given how much power you can have over the world? At first, financial, just make a lot of money, right? And then control by having possession of an AGI system?

[1:30:10](https://youtu.be/13CZPWmke6A?t=5410)
**Ilya Sutskever:** I'd find it trivial to do that. I'd find it trivial to relinquish this kind of... I mean, you know, the kind of scenario you are describing sounds terrifying to me. That's all. I would absolutely not want to be in that position.

[1:30:25](https://youtu.be/13CZPWmke6A?t=5425)
**Lex Fridman:** Do you think you represent the majority or the minority of people in the AI community? Well, I mean, open question, an important one. Are most people good? Is another way to ask it.

[1:30:42](https://youtu.be/13CZPWmke6A?t=5442)
**Ilya Sutskever:** So, I don't know if most people are good, but I think that when it really counts, people can be better than we think.

[1:30:56](https://youtu.be/13CZPWmke6A?t=5456)
**Lex Fridman:** That's beautifully put. Are there specific mechanisms you can think of aligning AGI and values to human values? Is that... Do you think about these problems of continued alignment as we develop the AI systems?

[1:31:02](https://youtu.be/13CZPWmke6A?t=5462)
**Ilya Sutskever:** Yeah, definitely. In some sense, the kind of question which you are asking is, if you have to translate that question to today's terms, it would be a question about how to get an RL agent that's optimizing a value function which itself is learned.

[1:31:16](https://youtu.be/13CZPWmke6A?t=5476)
**Ilya Sutskever:** And if you look at humans, humans are like that because the reward function, the value function of humans, is not external, it is internal.

[1:31:32](https://youtu.be/13CZPWmke6A?t=5492)
**Ilya Sutskever:** There are definite ideas of how to train a value function, basically an objective, you know, and as objective as possible, perception system that will be trained separately to recognize, to internalize human judgments on different situations. And then that component would then be integrated as the base value function for some more capable RL system. You could imagine a process like this. I'm not saying this is the process. I'm saying this is an example of the kind of thing you could do.

## Meaning of life

[1:32:10](https://youtu.be/13CZPWmke6A?t=5530)
**Lex Fridman:** So, on that topic of the objective functions of human existence, what do you think is the objective function that is implicit in human existence? What's the meaning of life?

[1:32:24](https://youtu.be/13CZPWmke6A?t=5544)
**Ilya Sutskever:** Oh... (long pause) I think the question is wrong in some way. I think that the question implies that there is an objective answer, which is an external answer, you know, your meaning of life is X. I think what's going on is that we exist, and that's amazing, and we should try to make the most of it and try to maximize our own value and enjoyment of a very short time while we do exist.

[1:32:55](https://youtu.be/13CZPWmke6A?t=5575)
**Lex Fridman:** It's funny because action does require an objective function. It's definitely there in some form, but it's difficult to make it explicit, and maybe impossible to make it explicit, I guess is what you're getting at. And that's an interesting fact of an RL environment. 

[1:33:11](https://youtu.be/13CZPWmke6A?t=5591)
**Ilya Sutskever:** Well, but I was making a slightly different point is that humans want things, and their wants create the drives that cause them to act. Our wants are our objective functions, our individual objective functions. We can later decide that we want to change what we wanted before is no longer good, and we want something else.

[1:33:31](https://youtu.be/13CZPWmke6A?t=5611)
**Lex Fridman:** But they're so dynamic. There's got to be some underlying sort, like Freud, there's things like sexual stuff, there's people who think it's the fear of death, and there's also the desire for knowledge, procreation, the evolutionary arguments. It seems there might be some kind of fundamental objective function from which everything else emerges.

[1:34:00](https://youtu.be/13CZPWmke6A?t=5640)
**Ilya Sutskever:** I think that probably there is an evolutionary objective function, which is to survive and procreate and make sure your children succeed. That would be my guess.

[1:34:05](https://youtu.be/13CZPWmke6A?t=5645)
**Ilya Sutskever:** But it doesn't give an answer to the question, what's the meaning of life. I think you can see how humans are part of this big process, this ancient process. We exist on a small planet, and that's it. So, given that we exist, try to make the most of it and try to enjoy more and suffer less as much as we can.

[1:34:30](https://youtu.be/13CZPWmke6A?t=5670)
**Lex Fridman:** Let me ask two silly questions about life. One, do you have regrets, moments that if you went back, you would do differently? And two, are there moments that you're especially proud of, that made you truly happy?

[1:34:48](https://youtu.be/13CZPWmke6A?t=5688)
**Ilya Sutskever:** So, I can answer that. I can answer both questions. 
Of course, there are a huge number of choices and decisions that I've made that, with the benefit of hindsight, I wouldn't have made them. And I do experience some regret. But, you know, I try to take solace in the knowledge that at the time, I did the best I could. And in terms of things that I'm proud of, there are... I'm very fortunate to have things I'm proud of, and they made me happy for some time. But I don't think that that is the source of happiness.

[1:35:18](https://youtu.be/13CZPWmke6A?t=5718)
**Lex Fridman:** So, your academic accomplishments, all the papers, you're one of the most cited people in the world, all the breakthroughs in computer vision and language and so on, is... what is the source of happiness and pride for you?

[1:35:29](https://youtu.be/13CZPWmke6A?t=5729)
**Ilya Sutskever:** I mean, all those things are a source of pride, for sure. I'm very grateful for having done all those things, and it was very fun to do them. But happiness comes from... well, my current view is that happiness comes to a very large degree from the way we look at things. You know, you can have a simple meal and be quite happy as a result, or you can talk to someone and be happy as a result as well. Or conversely, you can have a meal and be disappointed that the meal wasn't a better meal. So, I think a lot of happiness comes from that, but I'm not sure. I don't want to be too confident. 

[1:36:12](https://youtu.be/13CZPWmke6A?t=5772)
**Lex Fridman:** Being humble in the face of the uncertainty seems to be also a part of this whole happiness thing. Well, I don't think there's a better way to end it than a meaning of life and discussions of happiness.

[1:36:18](https://youtu.be/13CZPWmke6A?t=5778)
**Lex Fridman:** So, Ilya, thank you so much. You've given me a few incredible ideas. You've given the world many incredible ideas. I really appreciate it, and thanks for talking today.

[1:36:25](https://youtu.be/13CZPWmke6A?t=5785)
**Ilya Sutskever:** Yeah, thanks for stopping by. I really enjoyed it.

[1:36:30](https://youtu.be/13CZPWmke6A?t=5790)
**Lex Fridman:** Thanks for listening to this conversation with Ilya Sutskever. And thank you to our presenting sponsor, Cash App. Please consider supporting the podcast by downloading Cash App and using code lex podcast. If you enjoy this podcast, subscribe on YouTube, review it with 5 stars on Apple Podcast, support on Patreon, or simply connect with me on Twitter at Lex Fridman. 

And now, let me leave you with some words from Alan Turing on machine learning: "Instead of trying to produce a program to simulate the adult mind, why not rather try to produce one which simulates the child's? If this were then subjected to an appropriate course of education, one would obtain the adult brain." 

Thank you for listening, and hope to see you next time.
